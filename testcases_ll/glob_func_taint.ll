; ModuleID = 'testcases/Function Call Propagation/glob_func_taint.c'
source_filename = "testcases/Function Call Propagation/glob_func_taint.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@producer.local = internal global [32 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1, !dbg !8
@g = dso_local global ptr null, align 8, !dbg !14

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @producer() #0 !dbg !2 {
  %1 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef @producer.local), !dbg !28
  store ptr @producer.local, ptr @g, align 8, !dbg !29
  ret void, !dbg !30
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !31 {
  %1 = alloca i32, align 4
  %2 = alloca [32 x i8], align 16
  store i32 0, ptr %1, align 4
  call void @producer(), !dbg !36
    #dbg_declare(ptr %2, !37, !DIExpression(), !38)
  %3 = getelementptr inbounds [32 x i8], ptr %2, i64 0, i64 0, !dbg !39
  %4 = load ptr, ptr @g, align 8, !dbg !40
  %5 = call ptr @strcpy(ptr noundef %3, ptr noundef %4) #3, !dbg !41
  ret i32 0, !dbg !42
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "local", scope: !2, file: !3, line: 7, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "producer", scope: !3, file: !3, line: 6, type: !4, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6)
!3 = !DIFile(filename: "testcases/Function Call Propagation/glob_func_taint.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "cf3edebfcffb94c842290bc680cf6c5e")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !7, splitDebugInlining: false, nameTableKind: None)
!7 = !{!0, !8, !14}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !3, line: 8, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 24, elements: !12)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 3)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "g", scope: !6, file: !3, line: 4, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 256, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 32)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 8, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 2}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!28 = !DILocation(line: 8, column: 5, scope: !2)
!29 = !DILocation(line: 9, column: 7, scope: !2)
!30 = !DILocation(line: 10, column: 1, scope: !2)
!31 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 12, type: !32, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !35)
!32 = !DISubroutineType(types: !33)
!33 = !{!34}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !{}
!36 = !DILocation(line: 13, column: 5, scope: !31)
!37 = !DILocalVariable(name: "dst", scope: !31, file: !3, line: 14, type: !17)
!38 = !DILocation(line: 14, column: 10, scope: !31)
!39 = !DILocation(line: 15, column: 12, scope: !31)
!40 = !DILocation(line: 15, column: 17, scope: !31)
!41 = !DILocation(line: 15, column: 5, scope: !31)
!42 = !DILocation(line: 16, column: 5, scope: !31)
