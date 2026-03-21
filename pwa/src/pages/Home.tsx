import { useChecklist } from '../hooks/useChecklist'
import { pawsBed, situationalChecklists, shabbatChecklist } from '../data/checklists'

const situationalCards = [
  { section: situationalChecklists[0], shortName: 'Daytime Posture', icon: 'M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z' },
  { section: situationalChecklists[3], shortName: 'Before Bed', icon: 'M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z' },
  { section: situationalChecklists[2], shortName: 'Before Shower', icon: 'M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15' },
  { section: situationalChecklists[1], shortName: 'After Shelter', icon: 'M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6' },
  { section: situationalChecklists[4], shortName: 'Before Leaving', icon: 'M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z M15 11a3 3 0 11-6 0 3 3 0 016 0z' },
  { section: shabbatChecklist, shortName: 'Shabbat / Hag', icon: 'M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z' },
]

function ChecklistCard({
  shortName,
  sectionId,
  totalItems,
  color,
  iconPath,
  onStart,
}: {
  shortName: string
  sectionId: string
  totalItems: number
  color: string
  iconPath: string
  onStart: () => void
}) {
  const { getSectionProgress, resetSection } = useChecklist(sectionId)
  const progress = getSectionProgress()
  const checked = progress.total > 0 ? progress.checked : 0
  const isComplete = checked === totalItems && checked > 0
  const hasStarted = checked > 0
  const pct = totalItems > 0 ? Math.round((checked / totalItems) * 100) : 0

  return (
    <div
      className={`rounded-xl border overflow-hidden ${
        isComplete ? 'border-green-600/50 bg-green-950/20' : 'border-slate-700/50 bg-slate-800/30'
      }`}
    >
      <div className="p-3">
        <div className="flex items-center gap-2.5 mb-2">
          <div className="w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0" style={{ backgroundColor: `${color}30` }}>
            <svg className="w-4 h-4" style={{ color }} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
              <path strokeLinecap="round" strokeLinejoin="round" d={iconPath} />
            </svg>
          </div>
          <div className="flex-1 min-w-0">
            <div className="text-sm font-semibold text-slate-100 truncate">{shortName}</div>
            {hasStarted && (
              <div className="text-xs text-slate-500">{checked}/{totalItems} items</div>
            )}
          </div>
          {isComplete && (
            <svg className="w-5 h-5 text-green-400 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          )}
        </div>

        {/* Progress bar */}
        {hasStarted && (
          <div className="h-1.5 bg-slate-700/50 rounded-full overflow-hidden mb-2">
            <div
              className="h-full rounded-full transition-all duration-300"
              style={{ width: `${pct}%`, backgroundColor: isComplete ? '#22c55e' : color }}
            />
          </div>
        )}

        {/* Action buttons */}
        <div className="flex gap-2">
          <button
            type="button"
            onClick={onStart}
            className="flex-1 py-2 px-3 rounded-lg text-xs font-semibold text-center transition-colors active:scale-[0.97]"
            style={{
              backgroundColor: isComplete ? 'rgba(34, 197, 94, 0.15)' : `${color}20`,
              color: isComplete ? '#86efac' : color,
              border: `1px solid ${isComplete ? 'rgba(34, 197, 94, 0.3)' : `${color}40`}`,
            }}
          >
            {isComplete ? 'Review' : hasStarted ? 'Continue' : 'Start'}
          </button>
          {hasStarted && (
            <button
              type="button"
              onClick={(e) => { e.stopPropagation(); resetSection() }}
              className="py-2 px-3 rounded-lg text-xs font-medium text-slate-500 bg-slate-800/50 border border-slate-700/50 active:bg-slate-700 active:scale-[0.97]"
            >
              Reset
            </button>
          )}
        </div>
      </div>
    </div>
  )
}

export function Home({ onNavigate }: { onNavigate: (page: string) => void }) {
  const { getSectionProgress } = useChecklist(pawsBed.id)
  const progress = getSectionProgress()
  const pawsChecked = progress.total > 0 ? progress.checked : 0
  const pawsComplete = pawsChecked === pawsBed.items.length && pawsChecked > 0

  return (
    <div className="space-y-5">
      {/* Hero */}
      <div className="text-center pt-2 pb-1">
        <h1 className="text-xl font-bold text-slate-100">Emergency Readiness</h1>
        <p className="text-xs text-slate-500 mt-0.5">Based on HFC (Pikud HaOref) guidance</p>
      </div>

      {/* PAWS BED — primary action */}
      <button
        type="button"
        onClick={() => onNavigate('paws-bed')}
        className={`w-full p-4 rounded-2xl border-2 text-left active:scale-[0.98] transition-all ${
          pawsComplete
            ? 'bg-green-900/20 border-green-600/50'
            : 'bg-emerald-950/30 border-emerald-600/40'
        }`}
      >
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-emerald-800/40 flex items-center justify-center">
              <svg className="w-5 h-5 text-emerald-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </div>
            <div>
              <div className="text-xs font-semibold text-emerald-400 uppercase tracking-wider">Quick Check</div>
              <div className="text-lg font-bold text-slate-100">PAWS BED</div>
              <div className="text-xs text-slate-400">2-minute smoke test</div>
            </div>
          </div>
          <div className="text-right">
            {pawsComplete ? (
              <svg className="w-8 h-8 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
              </svg>
            ) : (
              <svg className="w-8 h-8 text-emerald-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z" />
              </svg>
            )}
            {pawsChecked > 0 && (
              <div className="text-xs text-slate-500 mt-0.5">{pawsChecked}/{pawsBed.items.length}</div>
            )}
          </div>
        </div>
      </button>

      {/* Decision Tree — emergency quick access */}
      <button
        type="button"
        onClick={() => onNavigate('decision-tree')}
        className="w-full p-3.5 rounded-xl bg-red-950/30 border border-red-800/40 text-left active:scale-[0.98] transition-all"
      >
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 rounded-lg bg-red-800/30 flex items-center justify-center">
            <svg className="w-5 h-5 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
            </svg>
          </div>
          <div className="flex-1">
            <div className="font-semibold text-red-300 text-sm">Siren Response</div>
            <div className="text-xs text-slate-400">Where to go when the siren sounds</div>
          </div>
          <svg className="w-4 h-4 text-slate-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M9 5l7 7-7 7" />
          </svg>
        </div>
      </button>

      {/* Situational checklists — direct access */}
      <div>
        <h2 className="text-sm font-semibold text-slate-400 uppercase tracking-wider mb-3">Situational Checklists</h2>
        <div className="grid grid-cols-2 gap-2.5">
          {situationalCards.map(({ section, shortName, icon }) => (
            <ChecklistCard
              key={section.id}
              shortName={shortName}
              sectionId={section.id}
              totalItems={section.items.length}
              color={section.color}
              iconPath={icon}
              onStart={() => onNavigate('situational')}
            />
          ))}
        </div>
      </div>

      {/* Secondary nav */}
      <div className="grid grid-cols-3 gap-2">
        {[
          { label: 'Master', page: 'master', color: '#c0392b', icon: 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4' },
          { label: 'Guide', page: 'guidance', color: '#2980b9', icon: 'M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253' },
          { label: 'Emergency', page: 'emergency', color: '#8e44ad', icon: 'M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z' },
        ].map((item) => (
          <button
            key={item.page}
            type="button"
            onClick={() => onNavigate(item.page)}
            className="p-3 rounded-xl bg-slate-800/40 border border-slate-700/40 text-center active:scale-[0.97] transition-all"
          >
            <svg className="w-5 h-5 mx-auto mb-1" style={{ color: item.color }} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
              <path strokeLinecap="round" strokeLinejoin="round" d={item.icon} />
            </svg>
            <div className="text-xs font-medium text-slate-300">{item.label}</div>
          </button>
        ))}
      </div>

      {/* Disclaimer */}
      <div className="text-xs text-slate-600 text-center px-4 pb-2">
        <p>Not an official government resource. Based on HFC published guidance.</p>
        <p className="mt-0.5">Always defer to official instructions from Pikud HaOref.</p>
      </div>
    </div>
  )
}
