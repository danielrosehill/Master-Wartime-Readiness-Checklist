import { PageHeader } from '../components/PageHeader'
import { Collapsible } from '../components/Collapsible'
import { ChecklistView } from '../components/ChecklistView'
import { useChecklist } from '../hooks/useChecklist'
import { masterChecklist } from '../data/checklists'

function SectionBadge({ sectionId, totalItems }: { sectionId: string; totalItems: number }) {
  const { getSectionProgress } = useChecklist(sectionId)
  const progress = getSectionProgress()
  const checked = progress.total > 0 ? progress.checked : 0

  if (checked === 0) return null

  return (
    <span
      className={`text-xs px-2 py-0.5 rounded-full flex-shrink-0 ${
        checked === totalItems ? 'bg-green-800/50 text-green-300' : 'bg-slate-700/50 text-slate-400'
      }`}
    >
      {checked}/{totalItems}
    </span>
  )
}

export function MasterChecklist() {
  return (
    <div>
      <PageHeader
        title="Master Checklist"
        subtitle="Full readiness verification. Run at the start of any escalation, after evacuation, or weekly during sustained conflict."
        color="#c0392b"
      />
      <div className="bg-red-950/30 border border-red-800/30 rounded-xl p-3 mb-4">
        <p className="text-sm text-red-300">
          Items marked <span className="font-bold">!!</span> are critical — do not skip these.
        </p>
      </div>
      <div className="space-y-3">
        {masterChecklist.map((section) => (
          <Collapsible
            key={section.id}
            title={section.title}
            color={section.color}
            badge={<SectionBadge sectionId={section.id} totalItems={section.items.length} />}
          >
            <ChecklistView section={section} />
          </Collapsible>
        ))}
      </div>
    </div>
  )
}
