; ModuleID = 'testcases/Function Call Propagation/pointers_cross_funcs.c'
source_filename = "testcases/Function Call Propagation/pointers_cross_funcs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @modify_through_pointer(ptr noundef %0) #0 !dbg !17 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !23, !DIExpression(), !24)
    #dbg_declare(ptr %3, !25, !DIExpression(), !26)
  %4 = load ptr, ptr %2, align 8, !dbg !27
  store ptr %4, ptr %3, align 8, !dbg !26
  %5 = load ptr, ptr %3, align 8, !dbg !28
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %5), !dbg !29
  ret void, !dbg !30
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @intermediate(ptr noundef %0) #0 !dbg !31 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !34, !DIExpression(), !35)
  %3 = load ptr, ptr %2, align 8, !dbg !36
  ret ptr %3, !dbg !37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @wrapper(ptr noundef %0) #0 !dbg !38 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !39, !DIExpression(), !40)
  %3 = load ptr, ptr %2, align 8, !dbg !41
  call void @modify_through_pointer(ptr noundef %3), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !44 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca [10 x i8], align 1
  %5 = alloca [10 x i8], align 1
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !47, !DIExpression(), !48)
    #dbg_declare(ptr %3, !49, !DIExpression(), !50)
  store ptr %2, ptr %3, align 8, !dbg !50
  %6 = load ptr, ptr %3, align 8, !dbg !51
  %7 = call ptr @intermediate(ptr noundef %6), !dbg !52
  call void @wrapper(ptr noundef %7), !dbg !53
    #dbg_declare(ptr %4, !54, !DIExpression(), !58)
    #dbg_declare(ptr %5, !59, !DIExpression(), !60)
  %8 = getelementptr inbounds [10 x i8], ptr %4, i64 0, i64 0, !dbg !61
  %9 = getelementptr inbounds [10 x i8], ptr %5, i64 0, i64 0, !dbg !61
  %10 = load i32, ptr %2, align 4, !dbg !62
  %11 = sext i32 %10 to i64, !dbg !62
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %8, ptr align 1 %9, i64 %11, i1 false), !dbg !61
  ret i32 0, !dbg !63
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 8, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Function Call Propagation/pointers_cross_funcs.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "affda3174b781897f3a9d94eec9339a4")
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
!17 = distinct !DISubprogram(name: "modify_through_pointer", scope: !2, file: !2, line: 6, type: !18, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !22)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !{}
!23 = !DILocalVariable(name: "ptr", arg: 1, scope: !17, file: !2, line: 6, type: !20)
!24 = !DILocation(line: 6, column: 34, scope: !17)
!25 = !DILocalVariable(name: "alias", scope: !17, file: !2, line: 7, type: !20)
!26 = !DILocation(line: 7, column: 10, scope: !17)
!27 = !DILocation(line: 7, column: 18, scope: !17)
!28 = !DILocation(line: 8, column: 17, scope: !17)
!29 = !DILocation(line: 8, column: 5, scope: !17)
!30 = !DILocation(line: 9, column: 1, scope: !17)
!31 = distinct !DISubprogram(name: "intermediate", scope: !2, file: !2, line: 11, type: !32, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !22)
!32 = !DISubroutineType(types: !33)
!33 = !{!20, !20}
!34 = !DILocalVariable(name: "ptr", arg: 1, scope: !31, file: !2, line: 11, type: !20)
!35 = !DILocation(line: 11, column: 24, scope: !31)
!36 = !DILocation(line: 12, column: 12, scope: !31)
!37 = !DILocation(line: 12, column: 5, scope: !31)
!38 = distinct !DISubprogram(name: "wrapper", scope: !2, file: !2, line: 15, type: !18, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !22)
!39 = !DILocalVariable(name: "ptr", arg: 1, scope: !38, file: !2, line: 15, type: !20)
!40 = !DILocation(line: 15, column: 19, scope: !38)
!41 = !DILocation(line: 16, column: 28, scope: !38)
!42 = !DILocation(line: 16, column: 5, scope: !38)
!43 = !DILocation(line: 17, column: 1, scope: !38)
!44 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 19, type: !45, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !22)
!45 = !DISubroutineType(types: !46)
!46 = !{!21}
!47 = !DILocalVariable(name: "value", scope: !44, file: !2, line: 20, type: !21)
!48 = !DILocation(line: 20, column: 9, scope: !44)
!49 = !DILocalVariable(name: "p", scope: !44, file: !2, line: 21, type: !20)
!50 = !DILocation(line: 21, column: 10, scope: !44)
!51 = !DILocation(line: 23, column: 26, scope: !44)
!52 = !DILocation(line: 23, column: 13, scope: !44)
!53 = !DILocation(line: 23, column: 5, scope: !44)
!54 = !DILocalVariable(name: "dest", scope: !44, file: !2, line: 24, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 10)
!58 = !DILocation(line: 24, column: 10, scope: !44)
!59 = !DILocalVariable(name: "src", scope: !44, file: !2, line: 25, type: !55)
!60 = !DILocation(line: 25, column: 10, scope: !44)
!61 = !DILocation(line: 26, column: 5, scope: !44)
!62 = !DILocation(line: 26, column: 23, scope: !44)
!63 = !DILocation(line: 28, column: 5, scope: !44)
