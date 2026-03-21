import { useState, useEffect, useRef } from 'react'
import { Home } from './pages/Home'
import { PawsBed } from './pages/PawsBed'
import { MasterChecklist } from './pages/MasterChecklist'
import { SituationalChecklists } from './pages/SituationalChecklists'
import { GuidanceNotes } from './pages/GuidanceNotes'
import { Emergency } from './pages/Emergency'
import { DecisionTree } from './pages/DecisionTree'
import { Settings } from './pages/Settings'

type Page = 'home' | 'paws-bed' | 'master' | 'situational' | 'guidance' | 'emergency' | 'decision-tree' | 'settings'

interface NavItem {
  page: Page
  label: string
  iconPath: string
}

const navItems: NavItem[] = [
  { page: 'home', label: 'Home', iconPath: 'M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6' },
  { page: 'paws-bed', label: 'PAWS BED', iconPath: 'M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z' },
  { page: 'master', label: 'Master Checklist', iconPath: 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4' },
  { page: 'situational', label: 'Situational Checklists', iconPath: 'M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z' },
  { page: 'guidance', label: 'Guidance Notes', iconPath: 'M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253' },
  { page: 'emergency', label: 'Emergency Info', iconPath: 'M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z' },
  { page: 'decision-tree', label: 'Decision Tree', iconPath: 'M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z' },
  { page: 'settings', label: 'Settings', iconPath: 'M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.066 2.573c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.573 1.066c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.066-2.573c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z M15 12a3 3 0 11-6 0 3 3 0 016 0z' },
]

function NavIcon({ d }: { d: string }) {
  return (
    <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
      <path strokeLinecap="round" strokeLinejoin="round" d={d} />
    </svg>
  )
}

export default function App() {
  const [page, setPage] = useState<Page>('home')
  const [prevPage, setPrevPage] = useState<Page>('home')
  const [sidebarOpen, setSidebarOpen] = useState(false)
  const backdropRef = useRef<HTMLDivElement>(null)

  const navigate = (target: string) => {
    setPrevPage(page)
    setPage(target as Page)
    setSidebarOpen(false)
    window.scrollTo(0, 0)
  }

  // Close sidebar on outside click
  useEffect(() => {
    if (!sidebarOpen) return
    const handler = (e: MouseEvent) => {
      if (e.target === backdropRef.current) setSidebarOpen(false)
    }
    document.addEventListener('mousedown', handler)
    return () => document.removeEventListener('mousedown', handler)
  }, [sidebarOpen])

  // Close sidebar on Escape
  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setSidebarOpen(false)
    }
    document.addEventListener('keydown', handler)
    return () => document.removeEventListener('keydown', handler)
  }, [])

  const renderPage = () => {
    switch (page) {
      case 'home':
        return <Home onNavigate={navigate} />
      case 'paws-bed':
        return <PawsBed />
      case 'master':
        return <MasterChecklist />
      case 'situational':
        return <SituationalChecklists />
      case 'guidance':
        return <GuidanceNotes />
      case 'emergency':
        return <Emergency onNavigate={navigate} />
      case 'decision-tree':
        return <DecisionTree onBack={() => navigate(prevPage)} />
      case 'settings':
        return <Settings />
      default:
        return <Home onNavigate={navigate} />
    }
  }

  return (
    <div className="flex flex-col h-full bg-slate-950">
      {/* Top bar */}
      <header className="sticky top-0 z-40 bg-slate-900/95 backdrop-blur-sm border-b border-slate-800 safe-top">
        <div className="flex items-center h-12 px-3">
          <button
            type="button"
            onClick={() => setSidebarOpen(true)}
            className="w-10 h-10 flex items-center justify-center rounded-lg text-slate-300 active:bg-slate-800"
            aria-label="Open menu"
          >
            <svg className="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>
          <span className="ml-2 text-sm font-semibold text-slate-200 truncate">Israel Emergency Guide</span>
        </div>
      </header>

      {/* Sidebar overlay */}
      {sidebarOpen && (
        <div ref={backdropRef} className="fixed inset-0 z-50 bg-black/60">
          <nav className="absolute left-0 top-0 bottom-0 w-72 bg-slate-900 border-r border-slate-700 flex flex-col shadow-2xl animate-slide-in">
            {/* Sidebar header */}
            <div className="flex items-center justify-between p-4 border-b border-slate-800">
              <span className="text-base font-bold text-slate-100">Navigation</span>
              <button
                type="button"
                onClick={() => setSidebarOpen(false)}
                className="w-8 h-8 flex items-center justify-center rounded-lg text-slate-400 active:bg-slate-800"
                aria-label="Close menu"
              >
                <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>

            {/* Nav items */}
            <div className="flex-1 overflow-y-auto py-2">
              {navItems.map((item) => (
                <button
                  key={item.page}
                  type="button"
                  onClick={() => navigate(item.page)}
                  className={`w-full flex items-center gap-3 px-4 py-3 text-left transition-colors ${
                    page === item.page
                      ? 'bg-blue-900/30 text-blue-300 border-r-2 border-blue-400'
                      : 'text-slate-300 active:bg-slate-800'
                  }`}
                >
                  <NavIcon d={item.iconPath} />
                  <span className="text-sm font-medium">{item.label}</span>
                </button>
              ))}
            </div>

            {/* Sidebar footer */}
            <div className="p-4 border-t border-slate-800">
              <p className="text-xs text-slate-500">Based on HFC guidance</p>
              <p className="text-xs text-slate-600">oref.org.il | Hotline: 104</p>
            </div>
          </nav>
        </div>
      )}

      {/* Content */}
      <main className="flex-1 overflow-y-auto scroll-area px-4 pt-4 pb-8">
        {renderPage()}
      </main>
    </div>
  )
}
