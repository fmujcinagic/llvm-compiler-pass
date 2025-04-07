; ModuleID = 'testcases/advanced_aliasing1.c'
source_filename = "testcases/advanced_aliasing1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @process(ptr noundef %0) #0 !dbg !10 {
  %2 = alloca ptr, align 8
  %3 = alloca [100 x i8], align 16
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !16, !DIExpression(), !17)
    #dbg_declare(ptr %3, !18, !DIExpression(), !22)
  %4 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !23
  %5 = load ptr, ptr %2, align 8, !dbg !24
  %6 = call ptr @strcpy(ptr noundef %4, ptr noundef %5) #3, !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
  %1 = alloca i32, align 4
  %2 = alloca [50 x i8], align 16
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !31, !DIExpression(), !35)
    #dbg_declare(ptr %3, !36, !DIExpression(), !37)
    #dbg_declare(ptr %4, !38, !DIExpression(), !40)
  %5 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0, !dbg !41
  %6 = load ptr, ptr @stdin, align 8, !dbg !42
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 50, ptr noundef %6), !dbg !43
  %8 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0, !dbg !44
  store ptr %8, ptr %3, align 8, !dbg !45
  store ptr %3, ptr %4, align 8, !dbg !46
  %9 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0, !dbg !47
  %10 = load ptr, ptr %3, align 8, !dbg !48
  %11 = call ptr @strcpy(ptr noundef %9, ptr noundef %10) #3, !dbg !49
  %12 = load ptr, ptr %4, align 8, !dbg !50
  %13 = load ptr, ptr %12, align 8, !dbg !51
  call void @process(ptr noundef %13), !dbg !52
  ret i32 0, !dbg !53
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "testcases/advanced_aliasing1.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "3d25a3c5ff92fbfac8a044f195b0fa65")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!10 = distinct !DISubprogram(name: "process", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{}
!16 = !DILocalVariable(name: "ptr", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!17 = !DILocation(line: 4, column: 20, scope: !10)
!18 = !DILocalVariable(name: "temp", scope: !10, file: !1, line: 5, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 800, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 100)
!22 = !DILocation(line: 5, column: 10, scope: !10)
!23 = !DILocation(line: 6, column: 12, scope: !10)
!24 = !DILocation(line: 6, column: 18, scope: !10)
!25 = !DILocation(line: 6, column: 5, scope: !10)
!26 = !DILocation(line: 7, column: 1, scope: !10)
!27 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 9, type: !28, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DILocalVariable(name: "buffer1", scope: !27, file: !1, line: 10, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 10, column: 10, scope: !27)
!36 = !DILocalVariable(name: "alias1", scope: !27, file: !1, line: 11, type: !13)
!37 = !DILocation(line: 11, column: 11, scope: !27)
!38 = !DILocalVariable(name: "alias2", scope: !27, file: !1, line: 12, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!40 = !DILocation(line: 12, column: 12, scope: !27)
!41 = !DILocation(line: 13, column: 11, scope: !27)
!42 = !DILocation(line: 13, column: 37, scope: !27)
!43 = !DILocation(line: 13, column: 5, scope: !27)
!44 = !DILocation(line: 15, column: 14, scope: !27)
!45 = !DILocation(line: 15, column: 12, scope: !27)
!46 = !DILocation(line: 16, column: 12, scope: !27)
!47 = !DILocation(line: 18, column: 12, scope: !27)
!48 = !DILocation(line: 18, column: 21, scope: !27)
!49 = !DILocation(line: 18, column: 5, scope: !27)
!50 = !DILocation(line: 20, column: 14, scope: !27)
!51 = !DILocation(line: 20, column: 13, scope: !27)
!52 = !DILocation(line: 20, column: 5, scope: !27)
!53 = !DILocation(line: 22, column: 5, scope: !27)
