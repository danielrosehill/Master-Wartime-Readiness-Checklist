import { useState, useCallback } from 'react'

const STORAGE_KEY = 'emergency-checklist-state'

interface ChecklistState {
  [key: string]: {
    checked: boolean
    timestamp: number
  }
}

function loadState(): ChecklistState {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    return raw ? JSON.parse(raw) : {}
  } catch {
    return {}
  }
}

function saveState(state: ChecklistState) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state))
  } catch {
    // Storage full or unavailable
  }
}

export function useChecklist(sectionId: string) {
  const [state, setState] = useState<ChecklistState>(loadState)

  const isChecked = useCallback(
    (itemId: string) => {
      const key = `${sectionId}:${itemId}`
      return state[key]?.checked ?? false
    },
    [sectionId, state],
  )

  const toggle = useCallback(
    (itemId: string) => {
      setState((prev) => {
        const key = `${sectionId}:${itemId}`
        const next = {
          ...prev,
          [key]: {
            checked: !prev[key]?.checked,
            timestamp: Date.now(),
          },
        }
        saveState(next)
        return next
      })
    },
    [sectionId],
  )

  const resetSection = useCallback(() => {
    setState((prev) => {
      const next = { ...prev }
      for (const key of Object.keys(next)) {
        if (key.startsWith(`${sectionId}:`)) {
          delete next[key]
        }
      }
      saveState(next)
      return next
    })
  }, [sectionId])

  const getSectionProgress = useCallback(() => {
    let total = 0
    let checked = 0
    for (const [key, val] of Object.entries(state)) {
      if (key.startsWith(`${sectionId}:`)) {
        total++
        if (val.checked) checked++
      }
    }
    return { total, checked }
  }, [sectionId, state])

  const getLastCompleted = useCallback(() => {
    let latest = 0
    for (const [key, val] of Object.entries(state)) {
      if (key.startsWith(`${sectionId}:`) && val.checked && val.timestamp > latest) {
        latest = val.timestamp
      }
    }
    return latest > 0 ? new Date(latest) : null
  }, [sectionId, state])

  return { isChecked, toggle, resetSection, getSectionProgress, getLastCompleted }
}

export function resetAllChecklists() {
  localStorage.removeItem(STORAGE_KEY)
}
