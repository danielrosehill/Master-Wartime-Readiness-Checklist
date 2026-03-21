import { PageHeader } from '../components/PageHeader'
import { ChecklistView } from '../components/ChecklistView'
import { pawsBed } from '../data/checklists'

export function PawsBed() {
  return (
    <div>
      <PageHeader
        title="PAWS BED"
        subtitle={pawsBed.description}
        color={pawsBed.color}
      />
      <div className="bg-emerald-950/30 border border-emerald-700/30 rounded-xl p-3 mb-4">
        <p className="text-sm text-emerald-300 font-medium text-center">
          Mnemonic: "Check your PAWS before BED"
        </p>
      </div>
      <ChecklistView section={pawsBed} />
    </div>
  )
}
