export interface GuidanceSection {
  id: string
  title: string
  color: string
  content: string[]
}

export const guidanceSections: GuidanceSection[] = [
  {
    id: 'go-bag',
    title: 'Choosing a Go Bag',
    color: '#2980b9',
    content: [
      'Your go bag is the single most important physical item in your readiness kit. A poor bag choice undermines everything inside it.',
      '**Use a backpack, not a tote bag, handbag, or shopping bag.** You need both hands free. You may be carrying a child, holding a torch, opening doors, navigating stairs in the dark, or helping someone else.',
      '**What to look for:** Two shoulder straps with padding. Chest/waist strap. Water-resistant material. 30-40 litre capacity. Multiple compartments (find things in the dark by feel). Durable zips. Dark or neutral colour.',
      '**What to avoid:** Tote bags, drawstring bags, single-strap sling bags. Wheeled luggage — useless on stairs. Very large bags (60L+ hiking packs). Fashion bags with no structure.',
      '**Once selected:** Affix reflective tape to straps or front panel. Assign each item a fixed pocket/location. Keep by the front door. Every household member should know where it is and what is in it.',
    ],
  },
  {
    id: 'shelter-leave',
    title: 'In Shelter — When To Leave',
    color: '#2980b9',
    content: [
      '**Wait for the all-clear.** Do NOT leave your protected space until you receive an all-clear notification from HFC (via the app, official media, or the all-clear siren pattern).',
      '**If you have no connectivity** (phone dead, no signal): Stay in shelter. Do NOT assume it\'s over because it\'s quiet. Use a battery-powered radio if available. Wait for someone with connectivity to confirm.',
      '**When in doubt, stay longer.** Leaving too early is far more dangerous than staying too long. Many casualties occur because people leave shelter prematurely.',
    ],
  },
  {
    id: 'shelter-behaviour',
    title: 'In Shelter — Behaviour',
    color: '#2980b9',
    content: [
      '**Children:** Use a calm, steady voice. Explain simply. Have a comfort item ready. Distraction helps (colouring book, small game). Hold young children close. Don\'t lie — acknowledge and redirect.',
      '**General:** Sit against an inner wall, below window line. Do NOT use elevators. Do NOT go outside to photograph interceptions — falling debris is the primary cause of civilian injuries. Keep the door closed until all-clear.',
      'If you smell gas or see structural damage, move to an alternative shelter and call 102 (Fire & Rescue). After all-clear, send a brief message to family confirming safety.',
    ],
  },
  {
    id: 'moving-shelter',
    title: 'Moving Safely to a Public Shelter',
    color: '#2980b9',
    content: [
      'The journey to shelter is one of the most dangerous moments — many injuries happen not from the threat itself but from falls, collisions, and panic on the way to safety.',
      '**Before you move:** Know where you\'re going. Hesitation in a stairwell costs seconds you don\'t have. Grab your go bag only if it\'s directly on the route — do not backtrack for it. If carrying a child, secure them first, then move.',
      '**On the stairs:** Hold the handrail. Do NOT run — move at a fast, controlled walk. A broken ankle is worse than arriving 3 seconds later. Stay to one side. If you are above others, do not push. If below and someone falls, stop and help if time allows.',
      '**Outside:** Watch the ground — broken glass, uneven pavement. Do NOT run across roads without looking. Wear closed-toe shoes. If you cannot reach shelter in time, enter the nearest solid building or lie flat.',
      '**At the shelter door:** Don\'t crowd the entrance. Let children, elderly, and mobility-limited individuals enter first. Move away from the door to make room.',
      '**Common injuries:** Falls on stairs (especially wet/dark/socks), tripping on uneven ground, cuts from bare feet, collisions in narrow hallways, panic-related sprains.',
    ],
  },
  {
    id: 'night-alarm',
    title: 'Waking Up to a Night Alarm',
    color: '#2980b9',
    content: [
      'This is one of the hardest scenarios. You are groggy, disoriented, possibly in total darkness. Everything in the Before Bed checklist exists to make this moment survivable on autopilot.',
      '**First 5 seconds:** Siren wakes you — don\'t process, just move. Feet on floor, into shoes (same spot every night). Grab glasses and phone. Caffeine pill (optional) — you may wish to take one with a sip of water to speed alertness. Not for everyone — skip if caffeine-sensitive or medically contraindicated.',
      '**Next 10-20 seconds:** Pull on clothes (or skip if sleeping in them). Grab torch if power is out. Move to protected space or front door.',
      '**Parents:** One parent goes to children. The other grabs the go bag (pre-assigned roles).',
      '**Key principles:** Do not think — follow procedure. Do not check phone for details (read in shelter). Torch before lights. It gets easier after 2-3 alarms.',
    ],
  },
  {
    id: 'alert-fatigue',
    title: 'Fighting Alert Fatigue',
    color: '#2980b9',
    content: [
      'After days or weeks of alerts, the temptation to stop reacting is enormous. "It\'s probably nothing." "It won\'t land here." This is alert fatigue, and it kills people.',
      '**Why it happens:** Repeated exposure reduces your response (normal neurology). Most alerts end without personal impact. Fatigue and disrupted sleep degrade motivation. Social pressure from neighbours not sheltering.',
      '**How to fight it:** Reframe every alert as the first one. Use the checklist mechanically. Keep your shoes on. Lower the effort, not the standard (sleep in clothes by the door). Talk about it with your household.',
      '**Remember:** Civilian injuries spike in weeks 2-3 of conflicts, when alert fatigue peaks. The threat doesn\'t decrease because you\'re tired of it.',
      'If you truly cannot bring yourself to move: get away from windows, sit against an inner wall, protect your head. Partial compliance is better than nothing.',
    ],
  },
  {
    id: 'wellness',
    title: 'Wellness During Protracted Conflict',
    color: '#2980b9',
    content: [
      '**Physical:** Sleep when you can (any sleep > no sleep). Eat regular meals — stress suppresses appetite, eat anyway. Drink water. Shower when you can (3-minute morale reset). Move your body. Manage medication — maintain 72-hour buffer.',
      '**Psychological:** Limit news to every 1-3 hours — don\'t doom-scroll. Maintain routines (morning coffee, reading to children). Stay connected. Acknowledge the difficulty. Watch for warning signs: persistent insomnia, inability to eat, withdrawal, rage, numbness, children regressing.',
      '**Support lines:** ERAN (1201) for emotional first aid. NATAL (1-800-363-363) for trauma support.',
      '**Practical:** Rotate responsibilities with household members. Restock proactively. Keep a routine for checklists. This is the structure that keeps you safe when motivation fades.',
      '**Children** need extra reassurance. Maintain bedtime routines. Don\'t dismiss fears — validate and redirect: "Yes, it\'s scary. And we have a plan, and our safe room works, and we\'re together."',
      '**Give yourself permission to function imperfectly.** Priority is safety, then wellbeing, then everything else.',
    ],
  },
  {
    id: 'resupply',
    title: 'During Lulls — Resupply & Maintenance',
    color: '#2980b9',
    content: [
      'When there\'s a pause in alerts — hours or days — use the window wisely. These lulls don\'t last.',
      '**Stay alert even during quiet periods.** Keep your phone on, HFC app running, and shoes accessible. Lulls can end without warning.',
      '**Resupply (with caution):** Stock up on water (top up to 72-hour supply per person, 9L each). Restock pantry (canned goods, shelf-stable foods — see Appendix I). Fill prescriptions (if pharmacies are open — don\'t wait for the last pill). Charge everything (phones, power banks, laptops, torches, radios). Repack go bag (replace anything used, check expiry dates). Fill car fuel (at least half a tank, queues may be long). Cash withdrawal (ATMs may go offline, keep small bills). Laundry (clean clothes ready for the next round).',
      '**Home & Safety:** Check mamad/shelter — anything displaced by shaking? Door still seals? Secure loose items — objects may have shifted from impacts. Test smoke detector and fire extinguisher — infrastructure damage increases fire risk. Check gas lines — if you smell gas, shut off and call 102.',
      '**Personal & Family:** Contact family and friends — confirm everyone is safe, update plans. Fill prescriptions and medical supplies — pharmacies may have limited hours. Shave, shower, do laundry — morale and normalcy matter. Sleep — real sleep, not a nap. Set an alarm if you\'re anxious about missing an alert. Play with children — normality is the best antidote to anxiety. Walk outside briefly — sunlight and fresh air if the area is safe.',
      '**Prioritise ruthlessly.** Water and medications first. Then power. Then food. Then everything else. Don\'t try to do it all — the lull may be short.',
    ],
  },
  {
    id: 'elderly',
    title: 'Caring for Elderly Neighbours & Vulnerable People',
    color: '#2980b9',
    content: [
      '**Before escalation:** Know your neighbours, especially those living alone. Exchange phone numbers. Establish a buddy system. Know who holds spare keys.',
      '**During alerts:** Check on them on your way to shelter (if safe). Help them to the safest position if they can\'t move. After the all-clear, knock and ask "Are you OK?"',
      '**Ongoing support:** Check they have food, water, medications. Help with technology (phone charged, HFC app configured). Offer to include them in supply runs.',
      'If they show distress: contact 118 (Welfare Ministry) or *8840 (Senior Citizens line).',
    ],
  },
  {
    id: 'public-shelters',
    title: 'Using Communal / Public Shelters',
    color: '#2980b9',
    content: [
      '**Official guidance:** The Home Front Command maintains information about public shelters and their locations. Check the HFC app or visit oref.org.il for the most current and authoritative information about shelters in your area.',
      '**Finding shelters:** Use the HFC app. Ask building committee (vaad bayit), neighbours, or municipality. Physically walk to your nearest 3 shelters.',
      '**Access issues:** Many public shelters are locked. Find out who holds the key. Some have restricted hours or are used as storage. If locked during an alert, try municipality emergency line (106-109).',
      '**Etiquette:** Make space. Priority: children, elderly, pregnant, disabled. Keep noise down. Share resources. Don\'t bring large items. Check pet policy in advance. Wear a mask if crowded.',
      '**After all-clear:** Take all belongings. Report damage or maintenance issues.',
    ],
  },
  {
    id: 'opsec',
    title: 'OPSEC & Information Discipline',
    color: '#2980b9',
    content: [
      '**Do NOT share:** Exact locations of impacts. Military or emergency service locations. Photos/videos revealing identifiable locations. Casualty information before family notification.',
      '**Do NOT believe:** Unverified reports on X/Telegram/WhatsApp. "Breaking" news from unknown accounts. Dramatic unconfirmed claims. Screenshots of alerts from unverified sources.',
      '**Do:** Get information from official sources (HFC app, IDF Spokesperson, Israel Police, Kan, Ynet, Times of Israel). Check before you share. Tell others to delete sensitive posts.',
      'Even well-intentioned sharing can be lethal OPSEC. When in doubt, don\'t post.',
    ],
  },
  {
    id: 'advance-warning',
    title: 'Preliminary Guidelines (Advance Warning)',
    color: '#2980b9',
    content: [
      'HFC operates a preliminary guideline system for attacks from distant sources (e.g. Yemen). This provides 3-5 minute advance warning before the actual Red Alert.',
      '**What to do:** The preliminary guideline does NOT require shelter entry. It means: prepare. Put shoes on. Locate phone. Know where you\'re going. Be ready.',
      '**If driving:** Look for a solid building to pull over near. Not a bridge or tunnel.',
      '**When the actual alert sounds:** Follow standard shelter procedure. The advance warning bought you preparation time — use it.',
    ],
  },
  {
    id: 'infiltration',
    title: 'Terrorist Infiltration',
    color: '#c0392b',
    content: [
      '**This is a DIFFERENT protocol from rocket/missile response.** Do NOT follow the standard shelter procedure for rockets — stay HIDDEN, not just sheltered.',
      '**If Indoors:** Lock the house door. Leave lights on outside the house (helps security forces navigate). Enter the Mamad, close the door properly, sit below the window line. If no Mamad — enter a hideaway (internal room with lockable door, no windows). Do NOT exit until official authorities announce the event has ended.',
      '**If Outdoors:** Immediately enter the nearest protected place (building, shop, public structure). Stay there until official authorities announce the event has ended.',
      '**If In a Vehicle:** If you can keep driving — get to a safe location nearby as fast as possible. If you cannot drive — stop on the side of the road, seek nearby shelter offering maximum protection. Stay in shelter until official authorities announce the event has ended.',
      '**Critical Reminders:** Traffic in the area is prohibited — entry banned until further notice. If a rocket/missile alert sounds DURING a terrorist infiltration — do NOT go to a protected space outside the house, including the stairwell. Stay where you are.',
      '**Mamad door:** Do NOT dismantle the Mamad door handle. Removing it damages the mechanism. To block entry from outside, barricade the handle with a heavy object.',
      '**Do NOT share your location** on social networks or media channels. Stay updated via Home Front Command messages on official platforms.',
      '**Licensed weapon holders:** Aim at the front door. Fire only on positive identification of a threat. Do not fire blindly through doors or walls.',
    ],
  },
  {
    id: 'uav-infiltration',
    title: 'Hostile Aerial Vehicle (UAV/Drone) Infiltration',
    color: '#c0392b',
    content: [
      'UAV infiltration uses the **same siren** as rocket/missile attacks but has **different behavioural guidelines**. Shelter time is **10 minutes** unless updated.',
      '**Means of Alert:** HFC App (personal alert based on location plus up to 10 areas of interest — caption "Infiltration of a Hostile Aerial Vehicle" appears with guidelines). National Emergency Portal (oref.org.il). HFC Sirens (rising and falling alarm — same sound as rocket/missile). Media (radio, TV, news websites).',
      '**If Indoors:** Go immediately to the most protected space: Mamad, Mamak, Mamam, shelter, inner stairwell, or inner room. Stay in the protected space for 10 minutes, unless another alert or additional guideline is received.',
      '**If Outdoors (built-up area):** Enter the optimal protected space in a nearby building. Do not stay in the entrance hall.',
      '**If Outdoors (open area):** Lie on the ground and protect your head with your hands. If you cannot lie down — crouch as much as possible and protect your head. Wait until an explicit guideline allows you to leave.',
      '**If In a Vehicle:** Stop at the side of the road, exit the vehicle, and enter the optimal protected space in a nearby building. If no building is reachable — exit and move away from the vehicle beyond the shoulder or safety railing, lie down, and protect your head. Only if you cannot exit the vehicle — pull over, open the windows, and crouch below the window line.',
      '**If On Public Transport:** Inter-city/school buses: driver stops at roadside and opens doors; passengers crouch below the window line. Urban buses: driver stops and opens doors for passengers to reach protected space. Trains: driver slows to 30 km/h; passengers crouch below window line and protect their heads.',
      '**Key difference from rockets:** UAV alerts require a 10-minute shelter time and you must wait for an explicit "all clear" — do not self-release based on quiet.',
    ],
  },
]

export const decisionTreeNotes = {
  timing: 'Stay in your protected space for 10 minutes OR until you receive an all-clear notification from HFC (via app, siren pattern, or official media) — whichever comes later.',
  sirenDuration: 'Siren duration = defense time. The length of the siren tells you how long you have to reach shelter. If the siren is 90 seconds, you have 90 seconds. Border areas may have 15 seconds or less.',
  invalidSpaces: 'NOT valid protected spaces: Kitchen, Bathroom, Toilet, Building entrance lobby, Caravans/prefab structures, Areas with ceramics, porcelain, or glass that could shatter.',
  stairwellPositioning: '3+ floors: at least 2 floors above you. 3-storey building: middle floor only. Stay on the staircase, not in the hallway.',
}

export const decisionTree = [
  {
    priority: 1,
    question: 'Do you have a MAMAD / MAMAK / MAMAM?',
    action: 'MAMAD',
    instructions: 'Close blast door (handle 90°). Close steel + glass windows. Sit against inner wall. WAIT FOR ALL-CLEAR.',
  },
  {
    priority: 2,
    question: 'Can you reach a SHELTER within the time available?',
    action: 'SHELTER',
    instructions: 'Building shelter or public shelter. Enter and close the door. WAIT FOR ALL-CLEAR.',
  },
  {
    priority: 3,
    question: 'Does your building have an INNER STAIRWELL (no windows or exterior walls)?',
    action: 'STAIRWELL',
    instructions: 'Stay in the CENTRE — not top floor, not ground floor. Stay on staircase, not in hallway. WAIT FOR ALL-CLEAR.',
  },
  {
    priority: 4,
    question: 'Is there an INNER ROOM with maximum walls and minimum windows?',
    action: 'INNER ROOM',
    instructions: 'Sit against inner wall, below window line. Not facing door. Close all doors. WAIT FOR ALL-CLEAR.',
  },
  {
    priority: 5,
    question: 'No protected space available',
    action: 'LAST RESORT',
    instructions: 'Lie flat on the ground. Protect your head with your hands. WAIT FOR ALL-CLEAR.',
  },
]
