; ModuleID = 'testcases/Misc/array_index_sensitivity3.c'
source_filename = "testcases/Misc/array_index_sensitivity3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Wrapper = type { %union.UnionSimple, ptr }
%union.UnionSimple = type { ptr, [96 x i8] }

@stdin = external global ptr, align 8
@.str = private unnamed_addr constant [16 x i8] c"constant string\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Wrapper, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [100 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !22, !DIExpression(), !37)
    #dbg_declare(ptr %3, !38, !DIExpression(), !40)
  store ptr %2, ptr %3, align 8, !dbg !40
  %5 = load ptr, ptr %3, align 8, !dbg !41
  %6 = getelementptr inbounds %struct.Wrapper, ptr %5, i32 0, i32 0, !dbg !42
  %7 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0, !dbg !41
  %8 = load ptr, ptr @stdin, align 8, !dbg !43
  %9 = call ptr @fgets(ptr noundef %7, i32 noundef 100, ptr noundef %8), !dbg !44
  %10 = load ptr, ptr %3, align 8, !dbg !45
  %11 = getelementptr inbounds %struct.Wrapper, ptr %10, i32 0, i32 1, !dbg !46
  store ptr @.str, ptr %11, align 8, !dbg !47
    #dbg_declare(ptr %4, !48, !DIExpression(), !49)
  %12 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0, !dbg !50
  %13 = load ptr, ptr %3, align 8, !dbg !51
  %14 = getelementptr inbounds %struct.Wrapper, ptr %13, i32 0, i32 0, !dbg !52
  %15 = load ptr, ptr %14, align 8, !dbg !53
  %16 = call ptr @strcpy(ptr noundef %12, ptr noundef %15) #3, !dbg !54
  %17 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0, !dbg !55
  %18 = load ptr, ptr %3, align 8, !dbg !56
  %19 = getelementptr inbounds %struct.Wrapper, ptr %18, i32 0, i32 1, !dbg !57
  %20 = load ptr, ptr %19, align 8, !dbg !57
  %21 = call ptr @strcpy(ptr noundef %17, ptr noundef %20) #3, !dbg !58
  ret i32 0, !dbg !59
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

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
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 20, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Misc/array_index_sensitivity3.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "76821f8646d80d800855829d6ef98f1b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 16)
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
!17 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 14, type: !18, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "w", scope: !17, file: !2, line: 15, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "Wrapper", file: !2, line: 12, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 9, size: 896, elements: !25)
!25 = !{!26, !36}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !24, file: !2, line: 10, baseType: !27, size: 832)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "UnionSimple", file: !2, line: 7, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !2, line: 4, size: 832, elements: !29)
!29 = !{!30, !32}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !28, file: !2, line: 5, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !28, file: !2, line: 6, baseType: !33, size: 800)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "safe_ptr", scope: !24, file: !2, line: 11, baseType: !31, size: 64, offset: 832)
!37 = !DILocation(line: 15, column: 13, scope: !17)
!38 = !DILocalVariable(name: "wp", scope: !17, file: !2, line: 16, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!40 = !DILocation(line: 16, column: 14, scope: !17)
!41 = !DILocation(line: 18, column: 11, scope: !17)
!42 = !DILocation(line: 18, column: 15, scope: !17)
!43 = !DILocation(line: 18, column: 47, scope: !17)
!44 = !DILocation(line: 18, column: 5, scope: !17)
!45 = !DILocation(line: 20, column: 5, scope: !17)
!46 = !DILocation(line: 20, column: 9, scope: !17)
!47 = !DILocation(line: 20, column: 18, scope: !17)
!48 = !DILocalVariable(name: "temp", scope: !17, file: !2, line: 21, type: !33)
!49 = !DILocation(line: 21, column: 10, scope: !17)
!50 = !DILocation(line: 22, column: 12, scope: !17)
!51 = !DILocation(line: 22, column: 18, scope: !17)
!52 = !DILocation(line: 22, column: 22, scope: !17)
!53 = !DILocation(line: 22, column: 24, scope: !17)
!54 = !DILocation(line: 22, column: 5, scope: !17)
!55 = !DILocation(line: 23, column: 12, scope: !17)
!56 = !DILocation(line: 23, column: 18, scope: !17)
!57 = !DILocation(line: 23, column: 22, scope: !17)
!58 = !DILocation(line: 23, column: 5, scope: !17)
!59 = !DILocation(line: 25, column: 5, scope: !17)
