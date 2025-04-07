; ModuleID = 'testcases/array_index_sensitivity.c'
source_filename = "testcases/array_index_sensitivity.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca [5 x i32], align 16
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !22, !DIExpression(), !26)
    #dbg_declare(ptr %3, !27, !DIExpression(), !28)
  store i32 0, ptr %3, align 4, !dbg !28
    #dbg_declare(ptr %4, !29, !DIExpression(), !30)
  %6 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2, !dbg !31
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %6), !dbg !32
    #dbg_declare(ptr %5, !33, !DIExpression(), !34)
  %8 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 0, !dbg !35
  %9 = load i32, ptr %8, align 16, !dbg !35
  store i32 %9, ptr %5, align 4, !dbg !34
  %10 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 2, !dbg !36
  %11 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2, !dbg !37
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %11, i64 4, i1 false), !dbg !38
  %12 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 0, !dbg !39
  %13 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 0, !dbg !40
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %12, ptr align 16 %13, i64 4, i1 false), !dbg !41
  %14 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 0, !dbg !42
  %15 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 0, !dbg !42
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %14, ptr align 16 %15, i64 20, i1 false), !dbg !42
  ret i32 0, !dbg !43
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 9, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/array_index_sensitivity.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "214b3e30f283a79d8e69bd933a7202f8")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !8, splitDebugInlining: false, nameTableKind: None)
!8 = !{!0}
!9 = !{i32 7, !"Dwarf Version", i32 5}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 8, !"PIC Level", i32 2}
!13 = !{i32 7, !"PIE Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 2}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!17 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 4, type: !18, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !2, line: 5, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 160, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 5)
!26 = !DILocation(line: 5, column: 9, scope: !17)
!27 = !DILocalVariable(name: "safe_var", scope: !17, file: !2, line: 6, type: !20)
!28 = !DILocation(line: 6, column: 9, scope: !17)
!29 = !DILocalVariable(name: "target", scope: !17, file: !2, line: 7, type: !23)
!30 = !DILocation(line: 7, column: 9, scope: !17)
!31 = !DILocation(line: 9, column: 18, scope: !17)
!32 = !DILocation(line: 9, column: 5, scope: !17)
!33 = !DILocalVariable(name: "non_tainted_element", scope: !17, file: !2, line: 11, type: !20)
!34 = !DILocation(line: 11, column: 9, scope: !17)
!35 = !DILocation(line: 11, column: 31, scope: !17)
!36 = !DILocation(line: 13, column: 13, scope: !17)
!37 = !DILocation(line: 13, column: 25, scope: !17)
!38 = !DILocation(line: 13, column: 5, scope: !17)
!39 = !DILocation(line: 15, column: 13, scope: !17)
!40 = !DILocation(line: 15, column: 25, scope: !17)
!41 = !DILocation(line: 15, column: 5, scope: !17)
!42 = !DILocation(line: 17, column: 5, scope: !17)
!43 = !DILocation(line: 19, column: 5, scope: !17)
