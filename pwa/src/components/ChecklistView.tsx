import { useState } from 'react'
import { useChecklist } from '../hooks/useChecklist'
import type { ChecklistSection } from '../data/checklists'

function CheckItem({
  id,
  label,
  details,
  critical,
  subItems,
  sectionId,
}: {
  id: string
  label: string
  details?: string
  critical?: boolean
  subItems?: string[]
  sectionId: string
}) {
  const { isChecked, toggle } = useChecklist(sectionId)
  const checked = isChecked(id)

  return (
    <button
      type="button"
      onClick={() => toggle(id)}
      className={`w-full text-left p-3 rounded-lg border transition-all active:scale-[0.98] ${
        checked
          ? 'bg-green-900/30 border-green-700/50'
          : critical
            ? 'bg-red-950/30 border-red-800/40'
            : 'bg-slate-800/50 border-slate-700/50'
      }`}
    >
      <div className="flex items-start gap-3">
        <div
          className={`mt-0.5 w-6 h-6 rounded flex-shrink-0 flex items-center justify-center border-2 transition-colors ${
            checked ? 'bg-green-600 border-green-600' : 'border-slate-500'
          }`}
        >
          {checked && (
            <svg className="w-4 h-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
            </svg>
          )}
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2">
            {critical && (
              <span className="inline-flex items-center justify-center w-5 h-5 rounded bg-red-800/50 flex-shrink-0">
                <svg className="w-3 h-3 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M12 9v2m0 4h.01" />
                </svg>
              </span>
            )}
            <span className={`font-medium ${checked ? 'text-green-300 line-through opacity-70' : 'text-slate-100'}`}>
              {label}
            </span>
          </div>
          {details && <p className={`text-sm mt-1 ${checked ? 'text-slate-500' : 'text-slate-400'}`}>{details}</p>}
          {subItems && (
            <ul className="mt-2 space-y-1">
              {subItems.map((item, i) => (
                <li key={i} className={`text-sm flex items-start gap-2 ${checked ? 'text-slate-500' : 'text-slate-400'}`}>
                  <span className="text-slate-600 mt-0.5">-</span>
                  <span>{item}</span>
                </li>
              ))}
            </ul>
          )}
        </div>
      </div>
    </button>
  )
}

export function ChecklistView({
  section,
  showProgress = true,
}: {
  section: ChecklistSection
  showProgress?: boolean
}) {
  const { resetSection, getSectionProgress } = useChecklist(section.id)
  const [showResetConfirm, setShowResetConfirm] = useState(false)
  const progress = getSectionProgress()
  const total = section.items.length
  const checked = progress.total > 0 ? progress.checked : 0
  const pct = total > 0 ? Math.round((checked / total) * 100) : 0
  const isComplete = checked === total && checked > 0
  const hasStarted = checked > 0

  const handleReset = () => {
    resetSection()
    setShowResetConfirm(false)
  }

  return (
    <div>
      {showProgress && (
        <div className="mb-4">
          {/* Progress header */}
          <div className="flex items-center justify-between mb-2">
            <div className="flex items-center gap-2">
              {isComplete ? (
                <svg className="w-5 h-5 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              ) : hasStarted ? (
                <svg className="w-5 h-5 text-amber-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              ) : null}
              <span className="text-sm text-slate-300 font-medium">
                {isComplete ? 'Complete' : hasStarted ? `${checked}/${total} checked` : `${total} items`}
              </span>
            </div>
          </div>

          {/* Progress bar */}
          <div className="h-2 bg-slate-800 rounded-full overflow-hidden">
            <div
              className="h-full rounded-full transition-all duration-300"
              style={{
                width: `${pct}%`,
                backgroundColor: isComplete ? '#22c55e' : section.color,
              }}
            />
          </div>

          {/* Action buttons */}
          {hasStarted && (
            <div className="mt-3 flex gap-2">
              {showResetConfirm ? (
                <>
                  <button
                    type="button"
                    onClick={handleReset}
                    className="flex-1 py-2 px-3 rounded-lg text-xs font-semibold bg-red-900/40 text-red-300 border border-red-800/50 active:bg-red-800/50"
                  >
                    Confirm Reset
                  </button>
                  <button
                    type="button"
                    onClick={() => setShowResetConfirm(false)}
                    className="py-2 px-3 rounded-lg text-xs font-medium text-slate-400 bg-slate-800/50 border border-slate-700/50 active:bg-slate-700"
                  >
                    Cancel
                  </button>
                </>
              ) : (
                <button
                  type="button"
                  onClick={() => setShowResetConfirm(true)}
                  className="py-2 px-3 rounded-lg text-xs font-medium text-slate-500 bg-slate-800/50 border border-slate-700/50 active:bg-slate-700 flex items-center gap-1.5"
                >
                  <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                  </svg>
                  Reset Progress
                </button>
              )}
            </div>
          )}
        </div>
      )}

      {/* Checklist items */}
      <div className="space-y-2">
        {section.items.map((item) => (
          <CheckItem
            key={item.id}
            sectionId={section.id}
            id={item.id}
            label={item.label}
            details={item.details}
            critical={item.critical}
            subItems={item.subItems}
          />
        ))}
      </div>

      {/* Bottom completion / reset */}
      {isComplete && (
        <div className="mt-4 p-3 rounded-xl bg-green-900/20 border border-green-700/30 text-center">
          <svg className="w-6 h-6 text-green-400 mx-auto mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <p className="text-sm text-green-300 font-medium">All items verified</p>
          <button
            type="button"
            onClick={() => setShowResetConfirm(true)}
            className="mt-2 text-xs text-slate-500 underline"
          >
            Reset to run again
          </button>
        </div>
      )}
    </div>
  )
}
