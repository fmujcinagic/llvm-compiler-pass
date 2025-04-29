; ModuleID = 'testcases/Function Call Propagation/ret_flow_simple.c'
source_filename = "testcases/Function Call Propagation/ret_flow_simple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@get_user.buf = internal global [64 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [5 x i8] c"%63s\00", align 1, !dbg !10

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @get_user() #0 !dbg !2 {
  %1 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef @get_user.buf), !dbg !26
  ret ptr @get_user.buf, !dbg !27
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !28 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [64 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !33, !DIExpression(), !34)
  %4 = call ptr @get_user(), !dbg !35
  store ptr %4, ptr %2, align 8, !dbg !34
    #dbg_declare(ptr %3, !36, !DIExpression(), !37)
  %5 = getelementptr inbounds [64 x i8], ptr %3, i64 0, i64 0, !dbg !38
  %6 = load ptr, ptr %2, align 8, !dbg !39
  %7 = call ptr @strcpy(ptr noundef %5, ptr noundef %6) #3, !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 5, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "get_user", scope: !3, file: !3, line: 4, type: !4, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !8)
!3 = !DIFile(filename: "testcases/Function Call Propagation/ret_flow_simple.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "7d8cc87800d5dd6de75a2fcba7400047")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(scope: null, file: !3, line: 6, type: !12, isLocal: true, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 40, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 5)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 512, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 64)
!18 = !{i32 7, !"Dwarf Version", i32 5}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 8, !"PIC Level", i32 2}
!22 = !{i32 7, !"PIE Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 2}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!26 = !DILocation(line: 6, column: 5, scope: !2)
!27 = !DILocation(line: 7, column: 5, scope: !2)
!28 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 10, type: !29, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !32)
!29 = !DISubroutineType(types: !30)
!30 = !{!31}
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !{}
!33 = !DILocalVariable(name: "data", scope: !28, file: !3, line: 11, type: !6)
!34 = !DILocation(line: 11, column: 11, scope: !28)
!35 = !DILocation(line: 11, column: 18, scope: !28)
!36 = !DILocalVariable(name: "dst", scope: !28, file: !3, line: 12, type: !15)
!37 = !DILocation(line: 12, column: 10, scope: !28)
!38 = !DILocation(line: 13, column: 12, scope: !28)
!39 = !DILocation(line: 13, column: 17, scope: !28)
!40 = !DILocation(line: 13, column: 5, scope: !28)
!41 = !DILocation(line: 14, column: 5, scope: !28)
