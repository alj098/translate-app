# Timeline (append-only)

## 2026-10-21T01:01:25+00:00 | lead | init
- action: case-init
- command_or_ref: skills/scripts/case-init.sh
- result_summary: case directory created; scope ready_for_act=true
- artifacts: [scope.md, workitems.md]
- evidence_ids: []
- decision_delta: [case_initialized]
- carry_forward_refs: [scope.md]
- next: open PRIMARY SKILL.md and ACT within scope

## 2026-10-21T01:02:10+00:00 | lead | route
- action: 路由命中 PRIMARY 并读取模块
- command_or_ref: skills/scripts/master-route.sh --hint "反汇编 .elf 样本的 check_code 校验函数"
- result_summary: PRIMARY=skills/ida-reverse/SKILL.md (R6, confidence high)；已读 ACTION REQUIRED
- artifacts: [scope.md]
- evidence_ids: []
- decision_delta: [primary_selected_R6]
- carry_forward_refs: [scope.md]
- next: 校验 tool-index 是否具备 IDA 执行面

## 2026-10-21T01:07:05+00:00 | lead | gate
- action: 工具门禁核查，PRIMARY 执行面缺失后切换等价工具
- command_or_ref: grep tool-index.md; command -v objdump readelf strings gdb
- result_summary: IDA/r2/ghidra 均不可用；bootstrap 需联网装商业工具，未执行；改用 binutils 等价静态分析
- artifacts: [evidence/artifacts/tool-gap.txt]
- evidence_ids: [E-005]
- decision_delta: [tool_gap_ida_missing, switch_to_binutils]
- carry_forward_refs: [scope.md, E-005]
- next: 执行静态侦察与反汇编

## 2026-10-21T01:05:20+00:00 | re-specialist | static
- action: 文件侦察、符号定位、check_code 反汇编与 .data 常量提取
- command_or_ref: file/sha256sum/readelf -sW/objdump -d/objdump -s
- result_summary: ELF64 PIE 未 strip；check_code 做 8 字节 XOR 后 memcmp；g_key@0x4018，g_target@0x4010
- artifacts: [evidence/artifacts/recon.txt, evidence/artifacts/symbols.txt, evidence/artifacts/disasm.txt]
- evidence_ids: [E-001, E-002, E-003]
- next: 由 key/target 反推输入

## 2026-10-21T01:06:31+00:00 | re-specialist | verify
- action: 推导 code[i]=target[i]^key[i] 并本地执行验证
- command_or_ref: python3 tools/derive_code.py; ./sample MrQ_fcud
- result_summary: 推导出 MrQ_fcud，执行返回 OK；错误输入返回 DENIED
- artifacts: [evidence/artifacts/derive-and-verify.txt]
- evidence_ids: [E-004]
- decision_delta: [finding_validated]
- next: 生成报告与证据复核

## 2026-10-21T01:08:00+00:00 | lead | wrap
- action: 生成报告并运行 case-review
- command_or_ref: python3 skills/case-review/scripts/review_case.py work/elf-demo --verify-hashes --strict
- result_summary: 报告 report/report.md 产出；证据链闭合
- artifacts: [report/report.md, review.md]
- evidence_ids: []
- next: (done)
