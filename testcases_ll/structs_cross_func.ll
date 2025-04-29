; ModuleID = 'testcases/Function Call Propagation/structs_cross_func.c'
source_filename = "testcases/Function Call Propagation/structs_cross_func.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.packet = type { [32 x i8] }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @sender(ptr noundef %0) #0 !dbg !17 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !28, !DIExpression(), !29)
  %3 = load ptr, ptr %2, align 8, !dbg !30
  %4 = getelementptr inbounds %struct.packet, ptr %3, i32 0, i32 0, !dbg !31
  %5 = getelementptr inbounds [32 x i8], ptr %4, i64 0, i64 0, !dbg !30
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %5), !dbg !32
  ret void, !dbg !33
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rec(ptr noundef %0) #0 !dbg !34 {
  %2 = alloca ptr, align 8
  %3 = alloca [32 x i8], align 16
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !35, !DIExpression(), !36)
    #dbg_declare(ptr %3, !37, !DIExpression(), !38)
  %4 = getelementptr inbounds [32 x i8], ptr %3, i64 0, i64 0, !dbg !39
  %5 = load ptr, ptr %2, align 8, !dbg !40
  %6 = getelementptr inbounds %struct.packet, ptr %5, i32 0, i32 0, !dbg !41
  %7 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !40
  %8 = call ptr @strcpy(ptr noundef %4, ptr noundef %7) #3, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !44 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.packet, align 1
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !48, !DIExpression(), !49)
  call void @sender(ptr noundef %2), !dbg !50
  call void @rec(ptr noundef %2), !dbg !51
  ret i32 0, !dbg !52
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 8, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Function Call Propagation/structs_cross_func.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "9f96728d5d10445682f1ec511c81319d")
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
!17 = distinct !DISubprogram(name: "sender", scope: !2, file: !2, line: 6, type: !18, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !27)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet", file: !2, line: 4, size: 256, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !21, file: !2, line: 4, baseType: !24, size: 256)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 32)
!27 = !{}
!28 = !DILocalVariable(name: "p", arg: 1, scope: !17, file: !2, line: 6, type: !20)
!29 = !DILocation(line: 6, column: 28, scope: !17)
!30 = !DILocation(line: 8, column: 17, scope: !17)
!31 = !DILocation(line: 8, column: 20, scope: !17)
!32 = !DILocation(line: 8, column: 5, scope: !17)
!33 = !DILocation(line: 9, column: 1, scope: !17)
!34 = distinct !DISubprogram(name: "rec", scope: !2, file: !2, line: 11, type: !18, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !27)
!35 = !DILocalVariable(name: "p", arg: 1, scope: !34, file: !2, line: 11, type: !20)
!36 = !DILocation(line: 11, column: 25, scope: !34)
!37 = !DILocalVariable(name: "buf", scope: !34, file: !2, line: 13, type: !24)
!38 = !DILocation(line: 13, column: 10, scope: !34)
!39 = !DILocation(line: 14, column: 12, scope: !34)
!40 = !DILocation(line: 14, column: 17, scope: !34)
!41 = !DILocation(line: 14, column: 20, scope: !34)
!42 = !DILocation(line: 14, column: 5, scope: !34)
!43 = !DILocation(line: 15, column: 1, scope: !34)
!44 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 17, type: !45, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !27)
!45 = !DISubroutineType(types: !46)
!46 = !{!47}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DILocalVariable(name: "p", scope: !44, file: !2, line: 19, type: !21)
!49 = !DILocation(line: 19, column: 19, scope: !44)
!50 = !DILocation(line: 20, column: 5, scope: !44)
!51 = !DILocation(line: 21, column: 5, scope: !44)
!52 = !DILocation(line: 22, column: 5, scope: !44)
