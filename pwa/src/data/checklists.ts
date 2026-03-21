export interface ChecklistItem {
  id: string
  label: string
  details?: string
  critical?: boolean
  subItems?: string[]
}

export interface ChecklistSection {
  id: string
  title: string
  description?: string
  color: string
  items: ChecklistItem[]
}

// PAWS BED Quick Smoke Test
export const pawsBed: ChecklistSection = {
  id: 'paws-bed',
  title: 'Quick Smoke Test — PAWS BED',
  description: 'Periodic rapid readiness check. Can be completed in under 2 minutes.',
  color: '#0e7c47',
  items: [
    { id: 'p', label: 'P — Phone', details: 'On, charged, HFC app running, correct alert area', critical: true },
    { id: 'a', label: 'A — Alerts', details: 'Wireless emergency alerts enabled, DND override verified', critical: true },
    { id: 'w', label: 'W — Water', details: '72-hour supply accessible and not expired', critical: true },
    { id: 's', label: 'S — Shelter', details: 'Nearest 3 shelters known, routes walkable', critical: true },
    { id: 'b', label: 'B — Bag', details: 'Go bag by door, zipped, contents verified', critical: true },
    { id: 'e', label: 'E — Exit', details: 'Hallway clear, door unlockable quickly', critical: true },
    { id: 'd', label: 'D — Dependents', details: 'All household members present or accounted for', critical: true },
  ],
}

// Master Checklist sections
export const masterChecklist: ChecklistSection[] = [
  {
    id: 'master-tech',
    title: 'Technical Systems & Alerts',
    color: '#c0392b',
    items: [
      {
        id: 'smartphone',
        label: 'Smartphone',
        critical: true,
        subItems: ['On person or location known', 'Battery level OK or charging'],
      },
      {
        id: 'smartphone-config',
        label: 'Smartphone Configuration',
        critical: true,
        subItems: [
          'Powered on (DND okay; airplane mode NOT okay)',
          'Location services enabled',
          'HFC app installed',
          'HFC app configured (see Appendix A)',
          'HFC app running',
          'Correct alert area validated',
          "Emergency wireless alerts activated — 'Extreme' threats alerting",
        ],
      },
      {
        id: 'computer',
        label: 'Computer',
        subItems: ['Red Alert app for browser is active', 'Correct location set', 'Tested and validated working'],
      },
    ],
  },
  {
    id: 'master-home',
    title: 'Home Environment',
    color: '#c0392b',
    items: [
      { id: 'water', label: 'Water', critical: true, details: '72 hours supply ready and accessible (3L/person/day), resupplied when necessary' },
      { id: 'food', label: 'Food', critical: true, details: 'Pantry goods stocked and resupplied when necessary' },
      { id: 'torch', label: 'Torch', details: 'Accessible — hand crank or battery with reserve' },
      { id: 'hallway', label: 'Hallway', critical: true, details: 'Clear (no obstructions)' },
      { id: 'fire-ext', label: 'Fire Extinguisher', details: 'Accessible. Smoke detector installed and tested' },
      {
        id: 'escape',
        label: 'Escape Routes',
        subItems: ['Primary exit identified', 'Secondary exit identified (back door, porch, emergency stairs)', 'Routes clear of obstacles'],
      },
      { id: 'baby-carry', label: 'Baby Carry', details: 'By front door' },
      { id: 'mamad', label: 'Mamad', details: 'Prepared (see Appendix C — Mamad Inspection)' },
    ],
  },
  {
    id: 'master-gobag',
    title: 'Go Bag',
    color: '#c0392b',
    items: [
      { id: 'prepared', label: 'Prepared', critical: true, subItems: ['By door', 'Zipped/sealed'] },
      {
        id: 'contents-basic',
        label: 'Contents (Basic)',
        critical: true,
        subItems: [
          'Phone charger and cable — packed',
          'Power bank — packed and level verified or charging',
          'Essential medications — packed, supply checked',
          'Torch — inside and charged',
          'N95 mask — packed (one per person)',
        ],
      },
      {
        id: 'contents-additional',
        label: 'Contents (Additional)',
        subItems: ['Emergency whistle', 'AM/FM radio — battery/charge OK', 'First aid kit — supplied', 'Travel router', 'Caffeine pills (optional — for rapid alertness during night alarms)'],
      },
      {
        id: 'contents-overnight',
        label: 'Contents (Overnight Shelter Stays)',
        subItems: [
          'Religious effects (siddur, tefilin)',
          'Food/drink for longer stays',
          'Eye mask and earplugs',
          'Beer/wine openers',
          'Water bottles',
          'Umbrellas',
          'Travel router + ethernet cable + AC supply',
          'Plug adapters/splitters',
          'Tent / blanket',
        ],
      },
      {
        id: 'travel-docs',
        label: 'Travel Documents',
        subItems: ['Passports — packed and validated', 'Cash — on hand / packed', 'National IDs — packed', 'Travel docs — packed'],
      },
    ],
  },
  {
    id: 'master-people',
    title: 'People & Dependents',
    color: '#c0392b',
    items: [
      { id: 'dependents', label: 'Dependents', critical: true, details: 'All household members present or accounted for and contactable' },
    ],
  },
  {
    id: 'master-babies',
    title: 'Babies & Young Children',
    color: '#c0392b',
    items: [
      {
        id: 'baby-supplies',
        label: 'Essential Supplies',
        critical: true,
        subItems: ['Diapers', 'Wipes', 'Pacifier', 'Formula', 'Bottle', 'Changing mat + privacy'],
      },
      {
        id: 'baby-ready',
        label: 'Ready To Go',
        critical: true,
        subItems: ['Clothed or clothes by bed', 'Babywear by door', 'Fed (if needed)', 'Cleaned (if needed)'],
      },
    ],
  },
  {
    id: 'master-person',
    title: 'Person & Personal Effects',
    color: '#c0392b',
    items: [
      { id: 'clothing-day', label: 'Clothing (Daytime)', critical: true, details: 'Dressed for weather' },
      { id: 'clothing-night', label: 'Clothing (Nighttime)', critical: true, details: 'By door, by bed, or sleeping in' },
      { id: 'footwear-day', label: 'Footwear (Daytime)', critical: true, details: 'Wearing closed-toe footwear' },
      { id: 'footwear-night', label: 'Footwear (Nighttime)', critical: true, details: 'By door or by bed — closed-toe' },
      { id: 'keys', label: 'Keys', critical: true, details: 'On person or by door' },
      { id: 'wallet', label: 'Wallet', details: 'On person or accessible' },
      { id: 'meds', label: 'Medications', details: 'Taken on schedule' },
      { id: 'rest', label: 'Rest', details: 'Taken when possible' },
      { id: 'hygiene', label: 'Hygiene', details: 'Shower, brush teeth, tend to generally' },
      { id: 'toilet', label: 'Toilet Visits', details: 'Taken as soon as possible' },
    ],
  },
  {
    id: 'master-awareness',
    title: 'Situational Awareness',
    color: '#c0392b',
    items: [
      { id: 'news', label: 'News Updates', details: 'Scanned every 1-3 hours, prioritising official/gov sources' },
      { id: 'alert-area', label: 'Alerting Area', details: 'Known' },
      {
        id: 'shelters',
        label: 'Public Shelters',
        subItems: [
          'Nearest 3 shelters known',
          'Accessibility verified',
          'Shelter is open',
          'Hours noted',
          'Exit timed and procedure agreed',
        ],
      },
      { id: 'hfc-check', label: 'HFC App', details: 'Checked — familiarise with current advice (once per day)' },
      { id: 'supply-maint', label: 'Supply Maintenance', details: 'Water/food replaced (3 months), batteries/electronics checked (6 months)' },
    ],
  },
]

// Situational Checklists
export const situationalChecklists: ChecklistSection[] = [
  {
    id: 'sit-daytime',
    title: 'Daytime At-Home Posture',
    description: 'Quick status check while at home during the day. Run after waking, and repeat after any disruption to routine.',
    color: '#d35400',
    items: [
      { id: 'phone', label: 'Phone', critical: true, details: 'On person or within arm\'s reach, charged or charging, HFC app running' },
      { id: 'dressed', label: 'Dressed', critical: true, details: 'Fully clothed, closed-toe shoes on (not slippers, not barefoot)' },
      { id: 'keys', label: 'Keys', critical: true, details: 'On person or in door / by door' },
      { id: 'gobag', label: 'Go Bag', critical: true, details: 'By door, zipped' },
      { id: 'exit', label: 'Exit Route', critical: true, details: 'Hallway clear, front door can be opened quickly' },
      { id: 'browser', label: 'Browser Alert', details: 'Red Alert extension active on computer (if at desk)' },
      {
        id: 'wfh',
        label: 'Working From Home',
        details: 'Stay dressed and shoed. Keep go bag by door. Use one ear only for headphones or keep volume low enough to hear a siren. Save work frequently — you may need to abandon your desk mid-sentence',
        subItems: [
          'Headphones: open-back or speakers preferred over noise-cancelling earbuds',
          'Video calls: state your situation at the start — you may need to leave abruptly',
          'Notify your team/manager once at the start of the escalation',
          'Do not let work compromise your readiness — if you are ignoring alerts, stop and reset',
        ],
      },
    ],
  },
  {
    id: 'sit-reset',
    title: 'After Returning From Shelter',
    description: 'Run immediately after the all-clear. Restore full readiness before the next alert.',
    color: '#d35400',
    items: [
      { id: 'gobag', label: 'Go Bag', critical: true, details: 'Back by door, re-zipped. Did anything fall out? Put it back now' },
      { id: 'phone', label: 'Phone', critical: true, details: 'Put on charge if battery dropped, HFC app still running' },
      { id: 'powerbank', label: 'Power Bank', details: 'Put on charge — may have been used in shelter' },
      { id: 'water', label: 'Water', details: 'Resupply if you drank from emergency stock' },
      { id: 'clothes', label: 'Clothes & Shoes', details: 'Back in position — by bed (night) or on person (day)' },
      { id: 'torch', label: 'Torch', details: 'Back in position — nightstand or go bag' },
      { id: 'dependents', label: 'Dependents', critical: true, details: 'All accounted for and safe' },
      {
        id: 'selfcare',
        label: 'Self-Care (You)',
        critical: true,
        subItems: ['Drink water', 'Eat if you can', 'Use the toilet', 'Shower if time allows', 'Rest when possible'],
      },
      {
        id: 'selfcare-kids',
        label: 'Self-Care (Children)',
        critical: true,
        subItems: ['Fed', 'Watered', 'Toileted / changed', 'Cleaned if possible', 'Rested — nap if timing allows'],
      },
      { id: 'news', label: 'News Check', details: 'Brief scan of official sources — is the situation ongoing?' },
    ],
  },
  {
    id: 'sit-shower',
    title: 'Before Showering',
    description: 'You are at your most vulnerable during a shower. Be quick.',
    color: '#d35400',
    items: [
      { id: 'news', label: 'News Check', critical: true, details: 'Situation scanned — no active alerts or imminent threat in your area' },
      { id: 'phone', label: 'Phone', critical: true, details: 'Volume at maximum — must be audible over running water. In bathroom or just outside door' },
      { id: 'clothes', label: 'Clothes', critical: true, details: 'Full outfit in bathroom — ready to throw on immediately (not in another room)' },
      { id: 'shoes', label: 'Footwear', critical: true, details: 'Closed-toe shoes by bathroom door' },
      { id: 'towel', label: 'Towel', details: 'Within reach for rapid dry-off' },
      { id: 'door', label: 'Door', details: 'Bathroom door unlocked' },
      { id: 'quick', label: 'Keep It Short', critical: true, details: 'Minimise time — you are at your most vulnerable' },
    ],
  },
  {
    id: 'sit-bedtime',
    title: 'Before Bed',
    description: 'Nighttime posture checklist.',
    color: '#d35400',
    items: [
      { id: 'news', label: 'News Check', details: 'Situation scanned — assess if safe to sleep at home tonight' },
      {
        id: 'phone',
        label: 'Phone',
        critical: true,
        details: 'Charging or charged. Not in airplane mode (DND/silent OK). Location services on. HFC app has notification + override permissions',
      },
      { id: 'clothes', label: 'Clothes', critical: true, details: 'Laid out by bed — full outfit ready to throw on in seconds' },
      { id: 'shoes', label: 'Footwear', critical: true, details: 'Closed-toe shoes by bed — ready to step into immediately' },
      { id: 'torch', label: 'Torch', details: 'Within arm\'s reach on nightstand, not buried in go bag' },
      { id: 'glasses', label: 'Glasses', details: 'By bed (if needed) — same spot every night' },
      { id: 'keys', label: 'Keys', details: 'Accessible — by bed or on hook by front door' },
      { id: 'gobag', label: 'Go Bag', critical: true, details: 'By door, contents verified, power bank on charge' },
      { id: 'exit', label: 'Exit Route', critical: true, details: 'Hallway clear — can navigate in the dark. Front door not double-locked' },
      { id: 'hearing', label: 'Hearing', critical: true, details: 'No earplugs — you must hear the siren and phone alert' },
      { id: 'dependents', label: 'Dependents', critical: true, details: 'All accounted for. Baby clothed or clothes by bed, babywear by door' },
    ],
  },
  {
    id: 'sit-leaving',
    title: 'Before Leaving Home',
    description: 'Pre-departure safety check.',
    color: '#d35400',
    items: [
      { id: 'gobag', label: 'Go Bag', critical: true, details: 'Taking with you' },
      { id: 'news', label: 'News Check', critical: true, details: 'Situation scanned before departure. Check HFC app for active alerts along route/destination' },
      { id: 'shelters', label: 'Shelters At Destination', critical: true, details: 'Nearest shelters identified at destination and along route' },
      { id: 'time', label: 'Time To Shelter', details: 'Known for destination area (check HFC Alerts tab)' },
      { id: 'phone', label: 'Phone', critical: true, details: 'Charged, HFC app running, location services on' },
      { id: 'fuel', label: 'Car Fuel', details: 'At least half a tank' },
      { id: 'notify', label: 'Household Notified', details: 'Destination and expected return communicated' },
    ],
  },
]

// Shabbat/Hag checklist
export const shabbatChecklist: ChecklistSection = {
  id: 'shabbat',
  title: 'Shabbat / Hag',
  description: 'For observant Jews — additional checks before Shabbat or Yom Tov. Pikuach nefesh (preservation of life) overrides all Shabbat prohibitions.',
  color: '#8e44ad',
  items: [
    { id: 'tv', label: 'Channel 14 / Gal Shaket', critical: true, subItems: ['Playing on TV before Shabbat', 'Volume tested — audible from bedrooms', 'Verify TV not muted'] },
    {
      id: 'radio',
      label: 'Emergency Radio',
      critical: true,
      subItems: ['Frequency and operation verified', 'Volume at maximum', 'Power supply — AC connected or sufficient batteries'],
    },
    { id: 'gobag', label: 'Go Bag', subItems: ['By door', 'Contents verified'] },
    { id: 'supplies', label: 'Shabbat Supplies', details: 'Packed — siddur, kiddush cup, snacks for shelter' },
    { id: 'shoes', label: 'Shoes', critical: true, details: 'Closed-toe by bed AND by door — do not rely on slippers' },
    { id: 'clothes', label: 'Clothes', details: 'Laid out by bed — full outfit, not just pyjamas' },
    { id: 'keys', label: 'Keys', details: 'By front door' },
    { id: 'torch', label: 'Torch', details: 'Within arm\'s reach — pre-set on nightstand' },
  ],
}

// HFC App Configuration
export const hfcAppChecklist: ChecklistSection = {
  id: 'hfc-app',
  title: 'HFC App Configuration (Android)',
  color: '#2563a0',
  items: [
    { id: 'installed', label: 'Installed', details: 'Verified' },
    { id: 'updated', label: 'Up To Date', details: 'No pending updates' },
    { id: 'area', label: 'Alerting Area', details: 'Set and identified' },
    {
      id: 'permissions',
      label: 'Permissions',
      subItems: [
        'DND exemption verified',
        '"Remove permissions if unused" disabled',
        'Battery optimisations disabled',
        'Background data access permitted',
        'Display over other apps granted',
      ],
    },
  ],
}

// Mamad Inspection
export const mamadChecklist: ChecklistSection = {
  id: 'mamad',
  title: 'Mamad (Protected Space) Inspection',
  description: 'Based on HFC (Pikud HaOref) guidelines for residential protected spaces.',
  color: '#2563a0',
  items: [
    { id: 'blast-door', label: 'Blast Door', subItems: ['Opens and closes easily', 'Handle turns 90° upward', 'Double lock functions'] },
    { id: 'door-seal', label: 'Door Seal', details: 'Rubber insulation present and not dried out or cracked (replace if brittle)' },
    { id: 'light-test', label: 'Light Test', details: 'No light penetration when door is sealed (light = inadequate seal)' },
    { id: 'steel-window', label: 'Steel Outer Window', details: 'Opens and closes easily' },
    {
      id: 'glass-window',
      label: 'Glass Inner Window',
      details: 'Functions correctly. Single-wing: verify both locks engage. Double-wing: remove both wings during escalation periods and store outside room (they cannot seal properly when closed)',
    },
    { id: 'ventilation', label: 'Ventilation Pipes', subItems: ['Rubber insulation intact', 'Steel cover screws tighten fully'] },
    { id: 'flammable', label: 'No Flammable / Hazardous Materials', details: 'None stored inside' },
    { id: 'glass-items', label: 'No Glass / Ceramics', details: 'No glass, ceramic, or porcelain items that could shatter' },
    { id: 'heavy-items', label: 'Heavy Items', details: 'Shelves and heavy items fixed to walls' },
    { id: 'gas-tanks', label: 'Gas Tanks', details: '3+ metres from protected room walls' },
    { id: 'supplies', label: 'Emergency Supplies', details: 'Stored inside or immediately nearby' },
    { id: 'ceiling-fan', label: 'No Ceiling Fan', details: 'Ceiling fans are prohibited in mamads' },
    { id: 'ventilation-use', label: 'Ventilation', details: 'Room is ventilated if used as bedroom. NOT used as kitchen/bathroom/washroom' },
  ],
}

// Appendix G: Pre-Emergency Home Safety
export const homeSafetyChecklist: ChecklistSection = {
  id: 'home-safety',
  title: 'Pre-Emergency Home Safety (Appendix G)',
  description: 'Preparation tasks to complete before an emergency — not wartime-active checks. Schedule a walk-through every 6 months or immediately after moving.',
  color: '#2563a0',
  items: [
    {
      id: 'bookcases',
      label: 'Bookcases & Shelves',
      subItems: ['Secured to walls with L-brackets or straps', 'Heavy objects stored low — not above head height'],
    },
    {
      id: 'appliances',
      label: 'Appliances',
      subItems: ['Wheeled appliances — wheels locked', 'Heavy appliances — stable and secured'],
    },
    {
      id: 'gas-shutoff',
      label: 'Gas Shutoff',
      critical: true,
      subItems: ['Location known by all household members', 'All members know how to shut off', 'Operation tested — turn clockwise 90° to close'],
    },
    {
      id: 'elec-shutoff',
      label: 'Electricity Shutoff',
      critical: true,
      subItems: ['Location known — main breaker box', 'All members know how to shut off'],
    },
    { id: 'fire-ext', label: 'Fire Extinguisher', subItems: ['Accessible and not expired', 'All members know how to use'] },
    { id: 'smoke-det', label: 'Smoke Detector', subItems: ['Installed — one per floor minimum', 'Tested and working (test monthly)', 'Batteries replaced annually'] },
    { id: 'water-heater', label: 'Water Heater', details: 'Strapped to wall to prevent toppling' },
    { id: 'windows', label: 'Windows', subItems: ['No glass objects on windowsills (can shatter into projectiles)', 'Blinds / shutters functional'] },
  ],
}

// Appendix I: Emergency Pantry Staples
export interface PantryCategory {
  category: string
  items: string
  shelfLife: string
}

export const pantryCategories: PantryCategory[] = [
  { category: 'Canned Goods', items: 'Tuna (שימורי טונה) · Chickpeas (חומוס) · Corn · Beans · Tomatoes · Sardines', shelfLife: '2–5 years' },
  { category: 'Grains & Starches', items: 'Rice · Pasta · Couscous · Matza / crackers · Instant oatmeal', shelfLife: '1–2 years' },
  { category: 'Proteins', items: 'Canned tuna/sardines · Tahini (טחינה) · Halva (חלווה) · Peanut butter · Canned hummus', shelfLife: '6–24 months' },
  { category: 'Dried Goods', items: 'Lentils (עדשים) · Dried fruits · Nuts · Sunflower seeds · Bamba', shelfLife: '6–12 months' },
  { category: 'Quick Energy', items: 'Energy bars · Chocolate · Honey · Jam · Sugar · Dates (תמרים)', shelfLife: '6–24 months' },
  { category: 'Beverages', items: 'Instant coffee · Tea bags · Powdered milk · Juice boxes (UHT)', shelfLife: '6–12 months' },
  { category: 'Cooking Aids', items: 'Salt · Cooking oil · Instant soup mix (קנורר) · Spices', shelfLife: '1–2 years' },
  { category: 'Baby / Special', items: 'Formula · Baby food jars · Gluten-free alternatives · Ensure-type drinks', shelfLife: 'Check labels' },
]

export const pantryNotes: string[] = [
  'Water: 3L per person per day. Minimum 72-hour supply = 9L per person. Store sealed, away from sunlight. Rotate every 6 months.',
  'Freeze extra water bottles — they keep food cold if power fails and become drinking water as they melt.',
  'Buy items you actually eat — rotate through normal cooking (FIFO: First In, First Out).',
  'Label everything with purchase date.',
  'No power = no fridge — plan for shelf-stable only.',
  'Keep a can opener with the pantry supplies (not in a drawer you won\'t find in the dark).',
  'All items above are available kosher at major Israeli chains (Shufersal, Rami Levy, Yochananof).',
  'Pesach: maintain a separate small stock of kitniyot-free / Pesach-suitable items if needed.',
  'Babies: maintain at least 2 weeks of formula at all times.',
  'Don\'t panic-buy. Build your stock gradually over 2–3 weeks. Add a few extra items to each regular shop.',
]
