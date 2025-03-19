; ModuleID = 'testcases/vuln_simple.c'
source_filename = "testcases/vuln_simple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [32 x i8] c"Now printing tainted stuff: %d\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !22 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [256 x i8], align 16
  %5 = alloca [8 x i8], align 1
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !27, !DIExpression(), !28)
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %2), !dbg !29
    #dbg_declare(ptr %3, !30, !DIExpression(), !31)
  %7 = load i32, ptr %2, align 4, !dbg !32
  store i32 %7, ptr %3, align 4, !dbg !31
  %8 = load i32, ptr %3, align 4, !dbg !33
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %8), !dbg !34
    #dbg_declare(ptr %4, !35, !DIExpression(), !39)
    #dbg_declare(ptr %5, !40, !DIExpression(), !44)
  %10 = getelementptr inbounds [8 x i8], ptr %5, i64 0, i64 0, !dbg !45
  %11 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0, !dbg !45
  %12 = load i32, ptr %3, align 4, !dbg !46
  %13 = sext i32 %12 to i64, !dbg !46
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %10, ptr align 16 %11, i64 %13, i1 false), !dbg !45
  ret i32 0, !dbg !47
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/vuln_simple.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "f15e7606c251c07c553b9e3c4dcedfd5")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 8, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 32)
!12 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !13, splitDebugInlining: false, nameTableKind: None)
!13 = !{!0, !7}
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 8, !"PIC Level", i32 2}
!18 = !{i32 7, !"PIE Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 2}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!22 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 4, type: !23, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !26)
!23 = !DISubroutineType(types: !24)
!24 = !{!25}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{}
!27 = !DILocalVariable(name: "x", scope: !22, file: !2, line: 5, type: !25)
!28 = !DILocation(line: 5, column: 9, scope: !22)
!29 = !DILocation(line: 6, column: 5, scope: !22)
!30 = !DILocalVariable(name: "new_tainted_x", scope: !22, file: !2, line: 7, type: !25)
!31 = !DILocation(line: 7, column: 9, scope: !22)
!32 = !DILocation(line: 7, column: 25, scope: !22)
!33 = !DILocation(line: 8, column: 48, scope: !22)
!34 = !DILocation(line: 8, column: 5, scope: !22)
!35 = !DILocalVariable(name: "source", scope: !22, file: !2, line: 9, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 2048, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 256)
!39 = !DILocation(line: 9, column: 10, scope: !22)
!40 = !DILocalVariable(name: "destination", scope: !22, file: !2, line: 10, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 8)
!44 = !DILocation(line: 10, column: 10, scope: !22)
!45 = !DILocation(line: 11, column: 5, scope: !22)
!46 = !DILocation(line: 11, column: 33, scope: !22)
!47 = !DILocation(line: 12, column: 5, scope: !22)
