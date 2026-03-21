import { useState } from 'react'
import { resetAllChecklists } from '../hooks/useChecklist'

export function Settings() {
  const [showConfirm, setShowConfirm] = useState(false)
  const [resetDone, setResetDone] = useState(false)

  const handleReset = () => {
    resetAllChecklists()
    setShowConfirm(false)
    setResetDone(true)
    setTimeout(() => setResetDone(false), 2000)
  }

  return (
    <div>
      <h1 className="text-xl font-bold text-slate-100 mb-6">Settings</h1>

      <div className="space-y-4">
        {/* Reset */}
        <div className="p-4 rounded-xl bg-slate-800/50 border border-slate-700/50">
          <h2 className="font-semibold text-slate-200 mb-1">Reset All Checklists</h2>
          <p className="text-sm text-slate-400 mb-3">Clear all checked items across all checklists.</p>
          {showConfirm ? (
            <div className="flex gap-2">
              <button
                type="button"
                onClick={handleReset}
                className="px-4 py-2 rounded-lg bg-red-700 text-white text-sm font-medium active:bg-red-600"
              >
                Yes, Reset Everything
              </button>
              <button
                type="button"
                onClick={() => setShowConfirm(false)}
                className="px-4 py-2 rounded-lg bg-slate-700 text-slate-300 text-sm font-medium active:bg-slate-600"
              >
                Cancel
              </button>
            </div>
          ) : (
            <button
              type="button"
              onClick={() => setShowConfirm(true)}
              className="px-4 py-2 rounded-lg bg-red-900/50 border border-red-800/40 text-red-300 text-sm font-medium active:bg-red-800/50"
            >
              Reset Checklists
            </button>
          )}
          {resetDone && <p className="text-sm text-green-400 mt-2">All checklists have been reset.</p>}
        </div>

        {/* About */}
        <div className="p-4 rounded-xl bg-slate-800/50 border border-slate-700/50">
          <h2 className="font-semibold text-slate-200 mb-1">About</h2>
          <div className="text-sm text-slate-400 space-y-1">
            <p>Israel Emergency Readiness Guide</p>
            <p>Based on Home Front Command (Pikud HaOref) published guidance.</p>
            <p>Community-authored by Daniel Rosehill with AI assistance.</p>
            <p className="text-slate-500 mt-2">
              This is not an official government resource.
              Always defer to official instructions from HFC, the IDF, Israel Police, and local authorities.
            </p>
          </div>
        </div>

        {/* Data Storage */}
        <div className="p-4 rounded-xl bg-slate-800/50 border border-slate-700/50">
          <h2 className="font-semibold text-slate-200 mb-1">Data Storage</h2>
          <p className="text-sm text-slate-400">
            All checklist data is stored locally on your device. No data is sent to any server.
            The app works fully offline.
          </p>
        </div>
      </div>
    </div>
  )
}
