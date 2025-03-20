; ModuleID = 'testcases/func_propagation.c'
source_filename = "testcases/func_propagation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @third_final_vuln(ptr noundef %0) #0 !dbg !17 {
  %2 = alloca ptr, align 8
  %3 = alloca [20 x i8], align 16
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !22, !DIExpression(), !23)
    #dbg_declare(ptr %3, !24, !DIExpression(), !28)
  %4 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0, !dbg !29
  %5 = load ptr, ptr %2, align 8, !dbg !30
  %6 = call ptr @strcpy(ptr noundef %4, ptr noundef %5) #3, !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @process(ptr noundef %0) #0 !dbg !33 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !34, !DIExpression(), !35)
  %3 = load ptr, ptr %2, align 8, !dbg !36
  call void @third_final_vuln(ptr noundef %3), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !39 {
  %1 = alloca i32, align 4
  %2 = alloca [50 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !43, !DIExpression(), !47)
  %3 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0, !dbg !48
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %3), !dbg !49
  %5 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0, !dbg !50
  call void @process(ptr noundef %5), !dbg !51
  ret i32 0, !dbg !52
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 15, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/func_propagation.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "d91a2f1a1a14ef7d96785f0e05b44c3f")
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
!17 = distinct !DISubprogram(name: "third_final_vuln", scope: !2, file: !2, line: 4, type: !18, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !{}
!22 = !DILocalVariable(name: "input", arg: 1, scope: !17, file: !2, line: 4, type: !20)
!23 = !DILocation(line: 4, column: 29, scope: !17)
!24 = !DILocalVariable(name: "buffer", scope: !17, file: !2, line: 5, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 20)
!28 = !DILocation(line: 5, column: 10, scope: !17)
!29 = !DILocation(line: 6, column: 12, scope: !17)
!30 = !DILocation(line: 6, column: 20, scope: !17)
!31 = !DILocation(line: 6, column: 5, scope: !17)
!32 = !DILocation(line: 7, column: 1, scope: !17)
!33 = distinct !DISubprogram(name: "process", scope: !2, file: !2, line: 9, type: !18, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!34 = !DILocalVariable(name: "input", arg: 1, scope: !33, file: !2, line: 9, type: !20)
!35 = !DILocation(line: 9, column: 20, scope: !33)
!36 = !DILocation(line: 10, column: 22, scope: !33)
!37 = !DILocation(line: 10, column: 5, scope: !33)
!38 = !DILocation(line: 11, column: 1, scope: !33)
!39 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !40, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!40 = !DISubroutineType(types: !41)
!41 = !{!42}
!42 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!43 = !DILocalVariable(name: "user_input", scope: !39, file: !2, line: 14, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 14, column: 10, scope: !39)
!48 = !DILocation(line: 15, column: 17, scope: !39)
!49 = !DILocation(line: 15, column: 5, scope: !39)
!50 = !DILocation(line: 16, column: 13, scope: !39)
!51 = !DILocation(line: 16, column: 5, scope: !39)
!52 = !DILocation(line: 17, column: 5, scope: !39)
