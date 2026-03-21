import { PageHeader } from '../components/PageHeader'
import { decisionTree } from '../data/guidance'

export function DecisionTree({ onBack }: { onBack: () => void }) {
  return (
    <div>
      <button
        type="button"
        onClick={onBack}
        className="flex items-center gap-1 text-sm text-slate-400 mb-4 active:text-slate-200"
      >
        <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
          <path strokeLinecap="round" strokeLinejoin="round" d="M15 19l-7-7 7-7" />
        </svg>
        Back
      </button>

      <PageHeader
        title="Protected Space Decision Tree"
        subtitle="When a Red Alert sounds, choose the highest-priority option you can reach within the time available."
        color="#c0392b"
      />

      {/* Warning Box */}
      <div className="bg-red-950/40 border border-red-800/50 rounded-xl p-4 mb-6">
        <p className="text-sm text-red-300 font-medium">
          Stay in your protected space for 10 minutes OR until you receive an all-clear notification from HFC
          — whichever comes later.
        </p>
        <p className="text-xs text-red-400/80 mt-2">
          Siren duration = defense time. The length of the siren tells you how long you have to reach shelter.
        </p>
      </div>

      {/* Decision Tree Steps */}
      <div className="space-y-3">
        {decisionTree.map((step, i) => (
          <div key={step.priority} className="relative">
            {/* Connector line */}
            {i < decisionTree.length - 1 && (
              <div className="absolute left-6 top-full w-0.5 h-3 bg-slate-700 z-0" />
            )}

            <div
              className={`rounded-xl border p-4 ${
                step.priority === 5
                  ? 'bg-amber-950/30 border-amber-800/40'
                  : 'bg-slate-800/50 border-slate-700/40'
              }`}
            >
              <div className="flex items-start gap-3">
                <div
                  className={`w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0 text-sm font-bold ${
                    step.priority <= 2
                      ? 'bg-green-800/60 text-green-300'
                      : step.priority <= 4
                        ? 'bg-blue-800/60 text-blue-300'
                        : 'bg-amber-800/60 text-amber-300'
                  }`}
                >
                  {step.priority}
                </div>
                <div className="flex-1">
                  <div className="font-semibold text-slate-100">{step.action}</div>
                  <p className="text-sm text-slate-400 mt-0.5">{step.question}</p>
                  <div className="mt-2 bg-slate-900/50 rounded-lg p-3">
                    <p className="text-sm text-slate-300">{step.instructions}</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Invalid spaces */}
      <div className="mt-6 bg-red-950/20 border border-red-900/30 rounded-xl p-4">
        <h3 className="font-semibold text-red-300 text-sm mb-2">NOT valid protected spaces:</h3>
        <p className="text-sm text-slate-400">
          Kitchen, Bathroom, Toilet, Building entrance lobby, Caravans / prefab structures,
          Areas with ceramics, porcelain, or glass that could shatter.
        </p>
        <h3 className="font-semibold text-red-300 text-sm mt-3 mb-1">Stairwell positioning:</h3>
        <p className="text-sm text-slate-400">
          3+ floors: at least 2 floors above you. 3-storey building: middle floor only.
          Stay on the staircase, not in the hallway.
        </p>
      </div>
    </div>
  )
}
