import { useState } from 'react'
import { PageHeader } from '../components/PageHeader'
import { ChecklistView } from '../components/ChecklistView'
import { useChecklist } from '../hooks/useChecklist'
import { situationalChecklists, shabbatChecklist } from '../data/checklists'

const allSections = [...situationalChecklists, shabbatChecklist]

function TabBadge({ sectionId, total }: { sectionId: string; total: number }) {
  const { getSectionProgress } = useChecklist(sectionId)
  const progress = getSectionProgress()
  if (progress.checked === 0) return null
  if (progress.checked === total) return <span className="w-2 h-2 rounded-full bg-green-500" />
  return <span className="w-2 h-2 rounded-full bg-amber-500" />
}

export function SituationalChecklists() {
  const [activeIdx, setActiveIdx] = useState(0)
  const active = allSections[activeIdx]

  return (
    <div>
      <PageHeader
        title="Situational Checklists"
        subtitle="Run every time during wartime or escalation."
        color="#d35400"
      />

      {/* Tabs */}
      <div className="flex gap-2 overflow-x-auto pb-3 mb-4 -mx-1 px-1 scrollbar-hide">
        {allSections.map((s, i) => {
          const shortTitle = s.title.replace(/^\d+\.\d+\s*/, '').replace('(Wartime)', '').replace('(Reset)', '').trim()
          return (
            <button
              key={s.id}
              type="button"
              onClick={() => setActiveIdx(i)}
              className={`flex-shrink-0 px-3 py-2 rounded-lg text-sm font-medium transition-colors flex items-center gap-1.5 ${
                i === activeIdx
                  ? 'bg-orange-900/40 text-orange-200 border border-orange-700/50'
                  : 'bg-slate-800/50 text-slate-400 border border-slate-700/30'
              }`}
            >
              {shortTitle}
              <TabBadge sectionId={s.id} total={s.items.length} />
            </button>
          )
        })}
      </div>

      {/* Active checklist */}
      <div>
        {active.description && (
          <p className="text-sm text-slate-400 mb-4 italic">{active.description}</p>
        )}
        <ChecklistView section={active} />
      </div>
    </div>
  )
}
