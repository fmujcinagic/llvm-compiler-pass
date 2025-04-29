; ModuleID = 'testcases/Misc/array_index_sensitivity2.c'
source_filename = "testcases/Misc/array_index_sensitivity2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca [5 x i32], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !22, !DIExpression(), !26)
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 20, i1 false), !dbg !26
    #dbg_declare(ptr %3, !27, !DIExpression(), !28)
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 20, i1 false), !dbg !28
  %4 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3, !dbg !29
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %4), !dbg !30
  %6 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3, !dbg !31
  %7 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3, !dbg !32
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %6, ptr align 4 %7, i64 4, i1 false), !dbg !33
  %8 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 1, !dbg !34
  %9 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 1, !dbg !35
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %8, ptr align 4 %9, i64 4, i1 false), !dbg !36
  ret i32 0, !dbg !37
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 7, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Misc/array_index_sensitivity2.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "93ab894c6e0bcf20d9e3c07c0356f984")
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
!27 = !DILocalVariable(name: "target", scope: !17, file: !2, line: 6, type: !23)
!28 = !DILocation(line: 6, column: 9, scope: !17)
!29 = !DILocation(line: 7, column: 18, scope: !17)
!30 = !DILocation(line: 7, column: 5, scope: !17)
!31 = !DILocation(line: 9, column: 13, scope: !17)
!32 = !DILocation(line: 9, column: 25, scope: !17)
!33 = !DILocation(line: 9, column: 5, scope: !17)
!34 = !DILocation(line: 10, column: 13, scope: !17)
!35 = !DILocation(line: 10, column: 25, scope: !17)
!36 = !DILocation(line: 10, column: 5, scope: !17)
!37 = !DILocation(line: 12, column: 5, scope: !17)
