// WCAG AA contrast check for text on the dark sections (#contact, footer).
// Run in the page: browse eval tests/contrast-dark-sections.js
(() => {
  const parse = c => (c.match(/[\d.]+/g) || []).map(Number);
  const lum = ([r, g, b]) => {
    const f = v => { v /= 255; return v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4; };
    return 0.2126 * f(r) + 0.7152 * f(g) + 0.0722 * f(b);
  };
  const bgOf = el => {
    for (let n = el; n; n = n.parentElement) {
      const c = parse(getComputedStyle(n).backgroundColor);
      if (c.length && (c[3] === undefined || c[3] > 0)) return c;
    }
    return [255, 255, 255];
  };
  const failures = [];
  document.querySelectorAll('#contact *, footer[role="contentinfo"] *').forEach(el => {
    const text = [...el.childNodes].filter(n => n.nodeType === 3).map(n => n.textContent.trim()).join(' ').trim();
    if (!text || el.closest('[aria-hidden="true"]') || el.offsetParent === null) return;
    const s = getComputedStyle(el);
    const fg = parse(s.color), bg = bgOf(el);
    const a = fg[3] === undefined ? 1 : fg[3];
    const mixed = fg.slice(0, 3).map((v, i) => v * a + bg[i] * (1 - a));
    const [l1, l2] = [lum(mixed), lum(bg)].sort((x, y) => y - x);
    const ratio = (l1 + 0.05) / (l2 + 0.05);
    const large = parseFloat(s.fontSize) >= 24 || (parseFloat(s.fontSize) >= 18.66 && +s.fontWeight >= 700);
    if (ratio < (large ? 3 : 4.5)) failures.push(`${ratio.toFixed(2)} ${s.color} "${text.slice(0, 40)}"`);
  });
  return failures.length ? `FAIL ${failures.length}\n` + failures.join('\n') : 'PASS';
})()
