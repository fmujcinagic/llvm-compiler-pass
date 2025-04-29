; ModuleID = 'testcases/Function Call Propagation/ret_flow_simple.c'
source_filename = "testcases/Function Call Propagation/ret_flow_simple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @get_user() #0 !dbg !17 {
  %1 = alloca [64 x i8], align 16
    #dbg_declare(ptr %1, !22, !DIExpression(), !26)
  %2 = getelementptr inbounds [64 x i8], ptr %1, i64 0, i64 0, !dbg !27
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %2), !dbg !28
  %4 = getelementptr inbounds [64 x i8], ptr %1, i64 0, i64 0, !dbg !29
  ret ptr %4, !dbg !30
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !31 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [64 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !35, !DIExpression(), !36)
  %4 = call ptr @get_user(), !dbg !37
  store ptr %4, ptr %2, align 8, !dbg !36
    #dbg_declare(ptr %3, !38, !DIExpression(), !39)
  %5 = getelementptr inbounds [64 x i8], ptr %3, i64 0, i64 0, !dbg !40
  %6 = load ptr, ptr %2, align 8, !dbg !41
  %7 = call ptr @strcpy(ptr noundef %5, ptr noundef %6) #3, !dbg !42
  ret i32 0, !dbg !43
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Function Call Propagation/ret_flow_simple.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "2e4f2be60b25991c2e56166f090cd9be")
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
!17 = distinct !DISubprogram(name: "get_user", scope: !2, file: !2, line: 4, type: !18, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !{}
!22 = !DILocalVariable(name: "buf", scope: !17, file: !2, line: 5, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 512, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 64)
!26 = !DILocation(line: 5, column: 10, scope: !17)
!27 = !DILocation(line: 6, column: 17, scope: !17)
!28 = !DILocation(line: 6, column: 5, scope: !17)
!29 = !DILocation(line: 7, column: 12, scope: !17)
!30 = !DILocation(line: 7, column: 5, scope: !17)
!31 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 10, type: !32, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!32 = !DISubroutineType(types: !33)
!33 = !{!34}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DILocalVariable(name: "data", scope: !31, file: !2, line: 11, type: !20)
!36 = !DILocation(line: 11, column: 11, scope: !31)
!37 = !DILocation(line: 11, column: 18, scope: !31)
!38 = !DILocalVariable(name: "dst", scope: !31, file: !2, line: 12, type: !23)
!39 = !DILocation(line: 12, column: 10, scope: !31)
!40 = !DILocation(line: 13, column: 12, scope: !31)
!41 = !DILocation(line: 13, column: 17, scope: !31)
!42 = !DILocation(line: 13, column: 5, scope: !31)
!43 = !DILocation(line: 14, column: 5, scope: !31)
