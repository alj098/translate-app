# Work Items

| ID | title | role | targets | surface | status | evidence | notes |
|----|-------|------|---------|---------|--------|----------|-------|
| WI-001 | Establish scope and auth | lead | case | process | done | | offline-sample preset |
| WI-002 | Triage ELF sample | re-specialist | sample | binary | done | E-001 | PIE, not stripped |
| WI-003 | Locate symbols and data | re-specialist | sample | binary | done | E-002 | check_code / g_key / g_target |
| WI-004 | Disassemble check_code | re-specialist | sample | binary | done | E-003 | XOR loop + memcmp |
| WI-005 | Derive and verify input | re-specialist | sample | binary | done | E-004 | MrQ_fcud -> OK |
| WI-006 | Resolve tool path | lead | case | process | done | E-005 | IDA missing, switched to binutils |
| WI-007 | Report and journal | lead | case | process | done | | report/report.md |

## Coverage
- [x] Recon/analysis complete for in_scope assets
- [x] Critical/High candidates triaged (or N/A for pure RE)
- [x] Validated findings have Evidence (E-*)
- [x] Path documented (attack/call/solve)
- [x] Timeline continuous across major phases
- [x] Report via docs-generator
- [ ] field-journal anonymized

## Refs
- skills/ops/timeline-workitem.md
- skills/ops/evidence-finding-path.md
