// Interactive Checklists — localStorage persistence + reset
(function() {
  const STORAGE_KEY = 'wartime-checklist-state';

  function getState() {
    try {
      return JSON.parse(localStorage.getItem(STORAGE_KEY)) || {};
    } catch(e) { return {}; }
  }

  function saveState(state) {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
    } catch(e) {}
  }

  function getCheckboxId(cb, index) {
    // Generate a stable ID from the checkbox's label text + index
    const label = cb.parentElement ? cb.parentElement.textContent.trim().substring(0, 60) : '';
    return 'cb-' + index + '-' + label.replace(/[^a-zA-Z0-9]/g, '').substring(0, 30);
  }

  function initCheckboxes() {
    const state = getState();
    const checkboxes = document.querySelectorAll('.task-list-item input[type="checkbox"]');

    checkboxes.forEach(function(cb, i) {
      const id = getCheckboxId(cb, i);
      cb.removeAttribute('disabled');
      cb.style.cursor = 'pointer';
      cb.style.width = '18px';
      cb.style.height = '18px';
      cb.style.accentColor = '#2563a0';

      // Restore state
      if (state[id]) {
        cb.checked = true;
        cb.parentElement.style.opacity = '0.6';
        cb.parentElement.style.textDecoration = 'line-through';
      }

      cb.addEventListener('change', function() {
        const currentState = getState();
        if (this.checked) {
          currentState[id] = true;
          this.parentElement.style.opacity = '0.6';
          this.parentElement.style.textDecoration = 'line-through';
        } else {
          delete currentState[id];
          this.parentElement.style.opacity = '1';
          this.parentElement.style.textDecoration = 'none';
        }
        saveState(currentState);
        updateProgress();
      });
    });

    updateProgress();
  }

  function updateProgress() {
    const checkboxes = document.querySelectorAll('.task-list-item input[type="checkbox"]');
    if (checkboxes.length === 0) return;

    const checked = document.querySelectorAll('.task-list-item input[type="checkbox"]:checked').length;
    const total = checkboxes.length;
    const pct = Math.round((checked / total) * 100);

    let bar = document.getElementById('checklist-progress');
    if (!bar) {
      bar = document.createElement('div');
      bar.id = 'checklist-progress';
      bar.style.cssText = 'position:fixed;bottom:0;left:0;right:0;background:#f5f5f5;border-top:1px solid #ccc;padding:8px 16px;display:flex;align-items:center;gap:12px;z-index:1000;font-size:14px;font-family:inherit;';
      bar.innerHTML = '<span id="progress-text"></span><div style="flex:1;background:#e0e0e0;border-radius:4px;height:8px;"><div id="progress-fill" style="height:100%;border-radius:4px;transition:width 0.3s;"></div></div><button id="reset-checklists" style="background:#c0392b;color:white;border:none;padding:6px 12px;border-radius:4px;cursor:pointer;font-size:13px;font-weight:bold;">Reset All</button>';
      document.body.appendChild(bar);
      document.body.style.paddingBottom = '50px';

      document.getElementById('reset-checklists').addEventListener('click', function() {
        if (confirm('Reset all checklists? This clears all checked items on all pages.')) {
          localStorage.removeItem(STORAGE_KEY);
          document.querySelectorAll('.task-list-item input[type="checkbox"]').forEach(function(cb) {
            cb.checked = false;
            cb.parentElement.style.opacity = '1';
            cb.parentElement.style.textDecoration = 'none';
          });
          updateProgress();
        }
      });
    }

    document.getElementById('progress-text').textContent = checked + '/' + total + ' (' + pct + '%)';
    const fill = document.getElementById('progress-fill');
    fill.style.width = pct + '%';
    fill.style.background = pct === 100 ? '#27774e' : '#2563a0';
  }

  // Init on page load and on navigation (for SPA-style mkdocs)
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initCheckboxes);
  } else {
    initCheckboxes();
  }

  // Re-init on mkdocs instant navigation
  if (typeof document$ !== 'undefined') {
    document$.subscribe(function() { initCheckboxes(); });
  }
})();
