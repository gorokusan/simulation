; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [325 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [644 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 244
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 278
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 319
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 201
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 262
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 262
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 282
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 218
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 264
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 316
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 317
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 216
	i32 220171995, ; 29: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221063263, ; 30: Microsoft.AspNetCore.Http.Connections.Client => 0xd2d285f => 176
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 238
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 221
	i32 269332001, ; 37: ChatApp.Client => 0x100dae21 => 0
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 240
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 237
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 288
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 43: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 44: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 316
	i32 318968648, ; 45: Xamarin.AndroidX.Activity.dll => 0x13031348 => 207
	i32 321597661, ; 46: System.Numerics => 0x132b30dd => 83
	i32 331817973, ; 47: ChatApp.Shared.dll => 0x13c723f5 => 320
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 301
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 239
	i32 348048101, ; 50: Microsoft.AspNetCore.Http.Connections.Common.dll => 0x14becae5 => 177
	i32 356389973, ; 51: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 300
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 53: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 54: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 55: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 56: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 57: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 58: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 59: _Microsoft.Android.Resource.Designer => 0x17969339 => 321
	i32 403441872, ; 60: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 61: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 312
	i32 441335492, ; 62: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 222
	i32 442565967, ; 63: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 64: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 235
	i32 451504562, ; 65: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 66: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 458494020, ; 67: Microsoft.AspNetCore.SignalR.Common.dll => 0x1b541044 => 180
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 70: System.dll => 0x1bff388e => 164
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 237
	i32 486930444, ; 72: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 250
	i32 498788369, ; 73: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 74: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 299
	i32 503918385, ; 75: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 293
	i32 513247710, ; 76: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 195
	i32 526420162, ; 77: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 78: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 282
	i32 530272170, ; 79: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 80: Microsoft.Extensions.Logging => 0x20216150 => 188
	i32 540030774, ; 81: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 82: System.Runtime.Extensions => 0x2080b118 => 103
	i32 545795345, ; 83: Microsoft.Extensions.Logging.Configuration.dll => 0x20882d11 => 190
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 85: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 86: Jsr305Binding => 0x213954e7 => 275
	i32 569601784, ; 87: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 273
	i32 577335427, ; 88: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 89: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 307
	i32 601371474, ; 90: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 91: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 227
	i32 627931235, ; 94: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 305
	i32 639843206, ; 95: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 233
	i32 643868501, ; 96: System.Net => 0x2660a755 => 81
	i32 662205335, ; 97: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 98: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 269
	i32 666292255, ; 99: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 214
	i32 672442732, ; 100: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 101: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 102: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 287
	i32 690569205, ; 103: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 104: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 284
	i32 692151471, ; 105: Microsoft.Extensions.Logging.Console.dll => 0x294164af => 191
	i32 693804605, ; 106: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 107: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 108: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 279
	i32 700358131, ; 109: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 110: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 302
	i32 709557578, ; 111: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 290
	i32 720511267, ; 112: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 283
	i32 722857257, ; 113: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 731701662, ; 114: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 194
	i32 735137430, ; 115: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 116: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 117: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 204
	i32 759454413, ; 118: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 119: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 120: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 121: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 311
	i32 789151979, ; 122: Microsoft.Extensions.Options => 0x2f0980eb => 193
	i32 790371945, ; 123: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 228
	i32 804715423, ; 124: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 242
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 832711436, ; 129: Microsoft.AspNetCore.SignalR.Protocols.Json.dll => 0x31a22b0c => 181
	i32 834051424, ; 130: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 131: Xamarin.AndroidX.Print => 0x3246f6cd => 255
	i32 873119928, ; 132: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 133: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 134: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 135: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 136: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 137: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 314
	i32 928116545, ; 138: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 278
	i32 952186615, ; 139: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 140: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 283
	i32 966729478, ; 141: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 276
	i32 967690846, ; 142: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 239
	i32 975236339, ; 143: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 144: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 145: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 146: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 147: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 148: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 149: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 150: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 259
	i32 1019214401, ; 151: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 152: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 186
	i32 1029334545, ; 153: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 289
	i32 1031528504, ; 154: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 277
	i32 1035644815, ; 155: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 212
	i32 1036536393, ; 156: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 157: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 158: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 246
	i32 1058641855, ; 159: Microsoft.AspNetCore.Http.Connections.Common => 0x3f1997bf => 177
	i32 1067306892, ; 160: GoogleGson => 0x3f9dcf8c => 174
	i32 1082857460, ; 161: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 162: Xamarin.Kotlin.StdLib => 0x409e66d8 => 280
	i32 1098259244, ; 163: System => 0x41761b2c => 164
	i32 1118262833, ; 164: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 302
	i32 1121599056, ; 165: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 245
	i32 1127624469, ; 166: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 192
	i32 1149092582, ; 167: Xamarin.AndroidX.Window => 0x447dc2e6 => 272
	i32 1168523401, ; 168: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 308
	i32 1170634674, ; 169: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 170: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 268
	i32 1178241025, ; 171: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 253
	i32 1203215381, ; 172: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 306
	i32 1204270330, ; 173: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 214
	i32 1208641965, ; 174: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 175: CommunityToolkit.Mvvm => 0x4868cc7b => 173
	i32 1219128291, ; 176: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1233093933, ; 177: Microsoft.AspNetCore.SignalR.Client.Core.dll => 0x497f852d => 179
	i32 1234928153, ; 178: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 304
	i32 1243150071, ; 179: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 273
	i32 1253011324, ; 180: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 181: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 288
	i32 1264511973, ; 182: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 263
	i32 1267360935, ; 183: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 267
	i32 1273260888, ; 184: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 219
	i32 1275534314, ; 185: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 284
	i32 1277892803, ; 186: ChatApp.Shared => 0x4c2b18c3 => 320
	i32 1278448581, ; 187: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 211
	i32 1293217323, ; 188: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 230
	i32 1309188875, ; 189: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 190: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 272
	i32 1324164729, ; 191: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 192: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 193: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 194: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 318
	i32 1376866003, ; 195: Xamarin.AndroidX.SavedState => 0x52114ed3 => 259
	i32 1379779777, ; 196: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 197: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 198: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 223
	i32 1408764838, ; 199: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 200: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1414043276, ; 201: Microsoft.AspNetCore.Connections.Abstractions.dll => 0x5448968c => 175
	i32 1422545099, ; 202: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 203: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 286
	i32 1434145427, ; 204: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 205: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 276
	i32 1439761251, ; 206: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 207: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 208: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 209: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 210: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 211: es\Microsoft.Maui.Controls.resources => 0x57152abe => 292
	i32 1461234159, ; 212: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 213: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 214: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 215: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 213
	i32 1470490898, ; 216: Microsoft.Extensions.Primitives => 0x57a5e912 => 195
	i32 1479771757, ; 217: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 218: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 219: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 220: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 260
	i32 1493001747, ; 221: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 296
	i32 1514721132, ; 222: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 291
	i32 1536373174, ; 223: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 224: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 225: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 226: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 227: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 311
	i32 1565862583, ; 228: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 229: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 230: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 231: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 232: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 229
	i32 1592978981, ; 233: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 234: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 277
	i32 1601112923, ; 235: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 236: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 237: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 238: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 249
	i32 1622358360, ; 239: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 240: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 271
	i32 1635184631, ; 241: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 233
	i32 1636350590, ; 242: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 226
	i32 1639515021, ; 243: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 244: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 245: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 246: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 247: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 265
	i32 1658251792, ; 248: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 274
	i32 1670060433, ; 249: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 221
	i32 1675553242, ; 250: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 251: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 252: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 253: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 254: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 255: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 256: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 281
	i32 1701541528, ; 257: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 258: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 242
	i32 1726116996, ; 259: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 260: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 261: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 217
	i32 1736233607, ; 262: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 309
	i32 1743415430, ; 263: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 287
	i32 1744735666, ; 264: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 265: System.IO.Pipelines.dll => 0x68139a0d => 202
	i32 1746316138, ; 266: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 267: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 268: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 269: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 270: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 271: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 264
	i32 1770582343, ; 272: Microsoft.Extensions.Logging.dll => 0x6988f147 => 188
	i32 1776026572, ; 273: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 274: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 275: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 276: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 303
	i32 1788241197, ; 277: Xamarin.AndroidX.Fragment => 0x6a96652d => 235
	i32 1793755602, ; 278: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 295
	i32 1808609942, ; 279: Xamarin.AndroidX.Loader => 0x6bcd3296 => 249
	i32 1813058853, ; 280: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 280
	i32 1813201214, ; 281: Xamarin.Google.Android.Material => 0x6c13413e => 274
	i32 1818569960, ; 282: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 254
	i32 1818787751, ; 283: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 284: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 285: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 286: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 189
	i32 1842015223, ; 287: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 315
	i32 1847515442, ; 288: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 204
	i32 1853025655, ; 289: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 312
	i32 1858542181, ; 290: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 291: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 292: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 294
	i32 1879696579, ; 293: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 294: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 215
	i32 1888955245, ; 295: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 296: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 297: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 298: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 299: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 300: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1945717188, ; 301: Microsoft.AspNetCore.SignalR.Client.Core => 0x73f949c4 => 179
	i32 1956758971, ; 302: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 303: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 261
	i32 1967334205, ; 304: Microsoft.AspNetCore.SignalR.Common => 0x7543233d => 180
	i32 1968388702, ; 305: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 182
	i32 1983156543, ; 306: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 281
	i32 1985761444, ; 307: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 206
	i32 2003115576, ; 308: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 291
	i32 2011961780, ; 309: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 310: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 246
	i32 2025202353, ; 311: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 286
	i32 2031763787, ; 312: Xamarin.Android.Glide => 0x791a414b => 203
	i32 2045470958, ; 313: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 314: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 184
	i32 2055257422, ; 315: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 241
	i32 2060060697, ; 316: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 317: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 290
	i32 2070888862, ; 318: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 319: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 320: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 321: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 322: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 323: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 324: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 325: Microsoft.Maui => 0x80bd55ad => 199
	i32 2169148018, ; 326: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 298
	i32 2181898931, ; 327: Microsoft.Extensions.Options.dll => 0x820d22b3 => 193
	i32 2192057212, ; 328: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 189
	i32 2193016926, ; 329: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 330: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 285
	i32 2201231467, ; 331: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 332: it\Microsoft.Maui.Controls.resources => 0x839595db => 300
	i32 2217644978, ; 333: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 268
	i32 2222056684, ; 334: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2229158877, ; 335: Microsoft.Extensions.Features.dll => 0x84de43dd => 187
	i32 2244775296, ; 336: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 250
	i32 2252106437, ; 337: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 338: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 339: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 340: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 183
	i32 2267999099, ; 341: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 205
	i32 2270573516, ; 342: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 294
	i32 2279755925, ; 343: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 257
	i32 2293034957, ; 344: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 345: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 346: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 347: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 304
	i32 2305521784, ; 348: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 349: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 209
	i32 2319144366, ; 350: Microsoft.AspNetCore.SignalR.Client => 0x8a3b55ae => 178
	i32 2320631194, ; 351: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 352: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 353: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 354: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 355: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 356: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 182
	i32 2378619854, ; 357: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 358: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 359: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 299
	i32 2401565422, ; 360: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 361: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 232
	i32 2421380589, ; 362: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 363: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 219
	i32 2427813419, ; 364: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 296
	i32 2435356389, ; 365: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 366: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 367: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 368: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 369: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 370: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 222
	i32 2471841756, ; 371: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 372: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 373: Microsoft.Maui.Controls => 0x93dba8a1 => 197
	i32 2483903535, ; 374: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 375: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 376: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 377: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 378: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 244
	i32 2522472828, ; 379: Xamarin.Android.Glide.dll => 0x9659e17c => 203
	i32 2538310050, ; 380: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 381: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 297
	i32 2559395616, ; 382: ChatApp.Client.dll => 0x988d4720 => 0
	i32 2562349572, ; 383: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 384: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 385: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 245
	i32 2581819634, ; 386: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 267
	i32 2585220780, ; 387: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 388: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 389: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 390: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 306
	i32 2605712449, ; 391: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 285
	i32 2615233544, ; 392: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 236
	i32 2616218305, ; 393: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 192
	i32 2617129537, ; 394: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 395: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 396: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 226
	i32 2624644809, ; 397: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 231
	i32 2626831493, ; 398: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 301
	i32 2627185994, ; 399: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 400: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 401: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 240
	i32 2637500010, ; 402: Microsoft.Extensions.Features => 0x9d350e6a => 187
	i32 2663391936, ; 403: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 205
	i32 2663698177, ; 404: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 405: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 406: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 407: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 408: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 409: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 410: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 265
	i32 2715334215, ; 411: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 412: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 413: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 414: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 415: Xamarin.AndroidX.Activity => 0xa2e0939b => 207
	i32 2735172069, ; 416: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 417: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 213
	i32 2740948882, ; 418: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 419: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 420: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 307
	i32 2758225723, ; 421: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 198
	i32 2764765095, ; 422: Microsoft.Maui.dll => 0xa4caf7a7 => 199
	i32 2765824710, ; 423: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 424: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 279
	i32 2778768386, ; 425: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 270
	i32 2779977773, ; 426: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 258
	i32 2785988530, ; 427: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 313
	i32 2788224221, ; 428: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 236
	i32 2801831435, ; 429: Microsoft.Maui.Graphics => 0xa7008e0b => 201
	i32 2803228030, ; 430: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 431: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 292
	i32 2810250172, ; 432: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 223
	i32 2819470561, ; 433: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 434: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 435: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 258
	i32 2824502124, ; 436: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 437: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 305
	i32 2838993487, ; 438: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 247
	i32 2849599387, ; 439: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 440: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 270
	i32 2855708567, ; 441: Xamarin.AndroidX.Transition => 0xaa36a797 => 266
	i32 2861098320, ; 442: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 443: Microsoft.Maui.Essentials => 0xaa8a4878 => 200
	i32 2870099610, ; 444: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 208
	i32 2875164099, ; 445: Jsr305Binding.dll => 0xab5f85c3 => 275
	i32 2875220617, ; 446: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2875347124, ; 447: Microsoft.AspNetCore.Http.Connections.Client.dll => 0xab6250b4 => 176
	i32 2884993177, ; 448: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 234
	i32 2887636118, ; 449: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 450: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 451: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 452: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 453: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 454: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 455: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 271
	i32 2919462931, ; 456: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 457: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 210
	i32 2936416060, ; 458: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 459: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 460: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 461: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 462: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2971004615, ; 463: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 194
	i32 2972252294, ; 464: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 465: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 230
	i32 2987532451, ; 466: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 261
	i32 2996846495, ; 467: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 243
	i32 3016983068, ; 468: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 263
	i32 3023353419, ; 469: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 470: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 238
	i32 3038032645, ; 471: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 321
	i32 3056245963, ; 472: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 260
	i32 3057625584, ; 473: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 251
	i32 3059408633, ; 474: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 475: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 476: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 477: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 298
	i32 3090735792, ; 478: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 479: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 480: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3109243939, ; 481: Microsoft.Extensions.Logging.Configuration => 0xb9534c23 => 190
	i32 3111772706, ; 482: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 483: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 484: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 485: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 486: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 487: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 488: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 489: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 490: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 252
	i32 3192346100, ; 491: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 492: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 493: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 494: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 495: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 229
	i32 3220365878, ; 496: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 497: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 498: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 499: Xamarin.AndroidX.CardView => 0xc235e84d => 217
	i32 3265493905, ; 500: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 501: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 502: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 503: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 504: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 505: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 506: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 507: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 508: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 293
	i32 3316684772, ; 509: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 510: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 227
	i32 3317144872, ; 511: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 512: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 215
	i32 3345895724, ; 513: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 256
	i32 3346324047, ; 514: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 253
	i32 3357674450, ; 515: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 310
	i32 3358260929, ; 516: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 517: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 208
	i32 3362522851, ; 518: Xamarin.AndroidX.Core => 0xc86c06e3 => 224
	i32 3366347497, ; 519: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 520: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 257
	i32 3381016424, ; 521: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 289
	i32 3395150330, ; 522: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 523: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 524: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 228
	i32 3421170118, ; 525: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 184
	i32 3428513518, ; 526: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 185
	i32 3429136800, ; 527: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 528: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 529: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 231
	i32 3445260447, ; 530: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 531: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 196
	i32 3463511458, ; 532: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 297
	i32 3466904072, ; 533: Microsoft.AspNetCore.SignalR.Client.dll => 0xcea4c208 => 178
	i32 3471940407, ; 534: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 535: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 536: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 310
	i32 3484440000, ; 537: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 309
	i32 3485117614, ; 538: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 539: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 540: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 220
	i32 3509114376, ; 541: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 542: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 543: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 544: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 545: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 546: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 547: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 317
	i32 3597029428, ; 548: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 206
	i32 3598340787, ; 549: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 550: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 551: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 552: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 255
	i32 3633644679, ; 553: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 210
	i32 3638274909, ; 554: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 555: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 241
	i32 3643446276, ; 556: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 314
	i32 3643854240, ; 557: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 252
	i32 3645089577, ; 558: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 559: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 183
	i32 3660523487, ; 560: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 561: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 562: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 216
	i32 3684561358, ; 563: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 220
	i32 3691870036, ; 564: Microsoft.AspNetCore.SignalR.Protocols.Json => 0xdc0d7754 => 181
	i32 3697841164, ; 565: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 319
	i32 3700866549, ; 566: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 567: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 225
	i32 3716563718, ; 568: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 569: Xamarin.AndroidX.Annotation => 0xdda814c6 => 209
	i32 3724971120, ; 570: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 251
	i32 3732100267, ; 571: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 572: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 573: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 574: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 575: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 218
	i32 3787005001, ; 576: Microsoft.AspNetCore.Connections.Abstractions => 0xe1b91c49 => 175
	i32 3792276235, ; 577: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 578: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 196
	i32 3802395368, ; 579: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 580: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 581: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 582: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 583: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 186
	i32 3844307129, ; 584: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 585: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 586: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 587: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 588: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 589: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 590: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 266
	i32 3888767677, ; 591: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 256
	i32 3889960447, ; 592: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 318
	i32 3896106733, ; 593: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 594: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 224
	i32 3901907137, ; 595: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 596: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 597: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 269
	i32 3928044579, ; 598: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 599: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 600: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 254
	i32 3945713374, ; 601: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 602: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 603: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 212
	i32 3959773229, ; 604: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 243
	i32 3980434154, ; 605: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 313
	i32 3987592930, ; 606: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 295
	i32 4003436829, ; 607: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 608: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 211
	i32 4023392905, ; 609: System.IO.Pipelines => 0xefd01a89 => 202
	i32 4025784931, ; 610: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 611: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 198
	i32 4054681211, ; 612: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 613: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 614: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4075152723, ; 615: Microsoft.Extensions.Logging.Console => 0xf2e5e553 => 191
	i32 4094352644, ; 616: Microsoft.Maui.Essentials.dll => 0xf40add04 => 200
	i32 4099507663, ; 617: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 618: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 619: Xamarin.AndroidX.Emoji2 => 0xf479582c => 232
	i32 4102112229, ; 620: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 308
	i32 4125707920, ; 621: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 303
	i32 4126470640, ; 622: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 185
	i32 4127667938, ; 623: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 624: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 625: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 626: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 315
	i32 4151237749, ; 627: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 628: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 629: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 630: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 631: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 632: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 248
	i32 4185676441, ; 633: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 634: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 635: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 636: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 225
	i32 4258378803, ; 637: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 247
	i32 4260525087, ; 638: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 639: Microsoft.Maui.Controls.dll => 0xfea12dee => 197
	i32 4274623895, ; 640: CommunityToolkit.Mvvm.dll => 0xfec99597 => 173
	i32 4274976490, ; 641: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 642: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 248
	i32 4294763496 ; 643: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 234
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [644 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 244, ; 3
	i32 278, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 319, ; 9
	i32 124, ; 10
	i32 201, ; 11
	i32 102, ; 12
	i32 262, ; 13
	i32 107, ; 14
	i32 262, ; 15
	i32 139, ; 16
	i32 282, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 218, ; 21
	i32 132, ; 22
	i32 264, ; 23
	i32 151, ; 24
	i32 316, ; 25
	i32 317, ; 26
	i32 18, ; 27
	i32 216, ; 28
	i32 26, ; 29
	i32 176, ; 30
	i32 238, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 91, ; 35
	i32 221, ; 36
	i32 0, ; 37
	i32 147, ; 38
	i32 240, ; 39
	i32 237, ; 40
	i32 288, ; 41
	i32 54, ; 42
	i32 69, ; 43
	i32 316, ; 44
	i32 207, ; 45
	i32 83, ; 46
	i32 320, ; 47
	i32 301, ; 48
	i32 239, ; 49
	i32 177, ; 50
	i32 300, ; 51
	i32 131, ; 52
	i32 55, ; 53
	i32 149, ; 54
	i32 74, ; 55
	i32 145, ; 56
	i32 62, ; 57
	i32 146, ; 58
	i32 321, ; 59
	i32 165, ; 60
	i32 312, ; 61
	i32 222, ; 62
	i32 12, ; 63
	i32 235, ; 64
	i32 125, ; 65
	i32 152, ; 66
	i32 180, ; 67
	i32 113, ; 68
	i32 166, ; 69
	i32 164, ; 70
	i32 237, ; 71
	i32 250, ; 72
	i32 84, ; 73
	i32 299, ; 74
	i32 293, ; 75
	i32 195, ; 76
	i32 150, ; 77
	i32 282, ; 78
	i32 60, ; 79
	i32 188, ; 80
	i32 51, ; 81
	i32 103, ; 82
	i32 190, ; 83
	i32 114, ; 84
	i32 40, ; 85
	i32 275, ; 86
	i32 273, ; 87
	i32 120, ; 88
	i32 307, ; 89
	i32 52, ; 90
	i32 44, ; 91
	i32 119, ; 92
	i32 227, ; 93
	i32 305, ; 94
	i32 233, ; 95
	i32 81, ; 96
	i32 136, ; 97
	i32 269, ; 98
	i32 214, ; 99
	i32 8, ; 100
	i32 73, ; 101
	i32 287, ; 102
	i32 155, ; 103
	i32 284, ; 104
	i32 191, ; 105
	i32 154, ; 106
	i32 92, ; 107
	i32 279, ; 108
	i32 45, ; 109
	i32 302, ; 110
	i32 290, ; 111
	i32 283, ; 112
	i32 109, ; 113
	i32 194, ; 114
	i32 129, ; 115
	i32 25, ; 116
	i32 204, ; 117
	i32 72, ; 118
	i32 55, ; 119
	i32 46, ; 120
	i32 311, ; 121
	i32 193, ; 122
	i32 228, ; 123
	i32 22, ; 124
	i32 242, ; 125
	i32 86, ; 126
	i32 43, ; 127
	i32 160, ; 128
	i32 181, ; 129
	i32 71, ; 130
	i32 255, ; 131
	i32 3, ; 132
	i32 42, ; 133
	i32 63, ; 134
	i32 16, ; 135
	i32 53, ; 136
	i32 314, ; 137
	i32 278, ; 138
	i32 105, ; 139
	i32 283, ; 140
	i32 276, ; 141
	i32 239, ; 142
	i32 34, ; 143
	i32 158, ; 144
	i32 85, ; 145
	i32 32, ; 146
	i32 12, ; 147
	i32 51, ; 148
	i32 56, ; 149
	i32 259, ; 150
	i32 36, ; 151
	i32 186, ; 152
	i32 289, ; 153
	i32 277, ; 154
	i32 212, ; 155
	i32 35, ; 156
	i32 58, ; 157
	i32 246, ; 158
	i32 177, ; 159
	i32 174, ; 160
	i32 17, ; 161
	i32 280, ; 162
	i32 164, ; 163
	i32 302, ; 164
	i32 245, ; 165
	i32 192, ; 166
	i32 272, ; 167
	i32 308, ; 168
	i32 153, ; 169
	i32 268, ; 170
	i32 253, ; 171
	i32 306, ; 172
	i32 214, ; 173
	i32 29, ; 174
	i32 173, ; 175
	i32 52, ; 176
	i32 179, ; 177
	i32 304, ; 178
	i32 273, ; 179
	i32 5, ; 180
	i32 288, ; 181
	i32 263, ; 182
	i32 267, ; 183
	i32 219, ; 184
	i32 284, ; 185
	i32 320, ; 186
	i32 211, ; 187
	i32 230, ; 188
	i32 85, ; 189
	i32 272, ; 190
	i32 61, ; 191
	i32 112, ; 192
	i32 57, ; 193
	i32 318, ; 194
	i32 259, ; 195
	i32 99, ; 196
	i32 19, ; 197
	i32 223, ; 198
	i32 111, ; 199
	i32 101, ; 200
	i32 175, ; 201
	i32 102, ; 202
	i32 286, ; 203
	i32 104, ; 204
	i32 276, ; 205
	i32 71, ; 206
	i32 38, ; 207
	i32 32, ; 208
	i32 103, ; 209
	i32 73, ; 210
	i32 292, ; 211
	i32 9, ; 212
	i32 123, ; 213
	i32 46, ; 214
	i32 213, ; 215
	i32 195, ; 216
	i32 9, ; 217
	i32 43, ; 218
	i32 4, ; 219
	i32 260, ; 220
	i32 296, ; 221
	i32 291, ; 222
	i32 31, ; 223
	i32 138, ; 224
	i32 92, ; 225
	i32 93, ; 226
	i32 311, ; 227
	i32 49, ; 228
	i32 141, ; 229
	i32 112, ; 230
	i32 140, ; 231
	i32 229, ; 232
	i32 115, ; 233
	i32 277, ; 234
	i32 157, ; 235
	i32 76, ; 236
	i32 79, ; 237
	i32 249, ; 238
	i32 37, ; 239
	i32 271, ; 240
	i32 233, ; 241
	i32 226, ; 242
	i32 64, ; 243
	i32 138, ; 244
	i32 15, ; 245
	i32 116, ; 246
	i32 265, ; 247
	i32 274, ; 248
	i32 221, ; 249
	i32 48, ; 250
	i32 70, ; 251
	i32 80, ; 252
	i32 126, ; 253
	i32 94, ; 254
	i32 121, ; 255
	i32 281, ; 256
	i32 26, ; 257
	i32 242, ; 258
	i32 97, ; 259
	i32 28, ; 260
	i32 217, ; 261
	i32 309, ; 262
	i32 287, ; 263
	i32 149, ; 264
	i32 202, ; 265
	i32 169, ; 266
	i32 4, ; 267
	i32 98, ; 268
	i32 33, ; 269
	i32 93, ; 270
	i32 264, ; 271
	i32 188, ; 272
	i32 21, ; 273
	i32 41, ; 274
	i32 170, ; 275
	i32 303, ; 276
	i32 235, ; 277
	i32 295, ; 278
	i32 249, ; 279
	i32 280, ; 280
	i32 274, ; 281
	i32 254, ; 282
	i32 2, ; 283
	i32 134, ; 284
	i32 111, ; 285
	i32 189, ; 286
	i32 315, ; 287
	i32 204, ; 288
	i32 312, ; 289
	i32 58, ; 290
	i32 95, ; 291
	i32 294, ; 292
	i32 39, ; 293
	i32 215, ; 294
	i32 25, ; 295
	i32 94, ; 296
	i32 89, ; 297
	i32 99, ; 298
	i32 10, ; 299
	i32 87, ; 300
	i32 179, ; 301
	i32 100, ; 302
	i32 261, ; 303
	i32 180, ; 304
	i32 182, ; 305
	i32 281, ; 306
	i32 206, ; 307
	i32 291, ; 308
	i32 7, ; 309
	i32 246, ; 310
	i32 286, ; 311
	i32 203, ; 312
	i32 88, ; 313
	i32 184, ; 314
	i32 241, ; 315
	i32 154, ; 316
	i32 290, ; 317
	i32 33, ; 318
	i32 116, ; 319
	i32 82, ; 320
	i32 20, ; 321
	i32 11, ; 322
	i32 162, ; 323
	i32 3, ; 324
	i32 199, ; 325
	i32 298, ; 326
	i32 193, ; 327
	i32 189, ; 328
	i32 84, ; 329
	i32 285, ; 330
	i32 64, ; 331
	i32 300, ; 332
	i32 268, ; 333
	i32 143, ; 334
	i32 187, ; 335
	i32 250, ; 336
	i32 157, ; 337
	i32 41, ; 338
	i32 117, ; 339
	i32 183, ; 340
	i32 205, ; 341
	i32 294, ; 342
	i32 257, ; 343
	i32 131, ; 344
	i32 75, ; 345
	i32 66, ; 346
	i32 304, ; 347
	i32 172, ; 348
	i32 209, ; 349
	i32 178, ; 350
	i32 143, ; 351
	i32 106, ; 352
	i32 151, ; 353
	i32 70, ; 354
	i32 156, ; 355
	i32 182, ; 356
	i32 121, ; 357
	i32 127, ; 358
	i32 299, ; 359
	i32 152, ; 360
	i32 232, ; 361
	i32 141, ; 362
	i32 219, ; 363
	i32 296, ; 364
	i32 20, ; 365
	i32 14, ; 366
	i32 135, ; 367
	i32 75, ; 368
	i32 59, ; 369
	i32 222, ; 370
	i32 167, ; 371
	i32 168, ; 372
	i32 197, ; 373
	i32 15, ; 374
	i32 74, ; 375
	i32 6, ; 376
	i32 23, ; 377
	i32 244, ; 378
	i32 203, ; 379
	i32 91, ; 380
	i32 297, ; 381
	i32 0, ; 382
	i32 1, ; 383
	i32 136, ; 384
	i32 245, ; 385
	i32 267, ; 386
	i32 134, ; 387
	i32 69, ; 388
	i32 146, ; 389
	i32 306, ; 390
	i32 285, ; 391
	i32 236, ; 392
	i32 192, ; 393
	i32 88, ; 394
	i32 96, ; 395
	i32 226, ; 396
	i32 231, ; 397
	i32 301, ; 398
	i32 31, ; 399
	i32 45, ; 400
	i32 240, ; 401
	i32 187, ; 402
	i32 205, ; 403
	i32 109, ; 404
	i32 158, ; 405
	i32 35, ; 406
	i32 22, ; 407
	i32 114, ; 408
	i32 57, ; 409
	i32 265, ; 410
	i32 144, ; 411
	i32 118, ; 412
	i32 120, ; 413
	i32 110, ; 414
	i32 207, ; 415
	i32 139, ; 416
	i32 213, ; 417
	i32 54, ; 418
	i32 105, ; 419
	i32 307, ; 420
	i32 198, ; 421
	i32 199, ; 422
	i32 133, ; 423
	i32 279, ; 424
	i32 270, ; 425
	i32 258, ; 426
	i32 313, ; 427
	i32 236, ; 428
	i32 201, ; 429
	i32 159, ; 430
	i32 292, ; 431
	i32 223, ; 432
	i32 163, ; 433
	i32 132, ; 434
	i32 258, ; 435
	i32 161, ; 436
	i32 305, ; 437
	i32 247, ; 438
	i32 140, ; 439
	i32 270, ; 440
	i32 266, ; 441
	i32 169, ; 442
	i32 200, ; 443
	i32 208, ; 444
	i32 275, ; 445
	i32 40, ; 446
	i32 176, ; 447
	i32 234, ; 448
	i32 81, ; 449
	i32 56, ; 450
	i32 37, ; 451
	i32 97, ; 452
	i32 166, ; 453
	i32 172, ; 454
	i32 271, ; 455
	i32 82, ; 456
	i32 210, ; 457
	i32 98, ; 458
	i32 30, ; 459
	i32 159, ; 460
	i32 18, ; 461
	i32 127, ; 462
	i32 194, ; 463
	i32 119, ; 464
	i32 230, ; 465
	i32 261, ; 466
	i32 243, ; 467
	i32 263, ; 468
	i32 165, ; 469
	i32 238, ; 470
	i32 321, ; 471
	i32 260, ; 472
	i32 251, ; 473
	i32 170, ; 474
	i32 16, ; 475
	i32 144, ; 476
	i32 298, ; 477
	i32 125, ; 478
	i32 118, ; 479
	i32 38, ; 480
	i32 190, ; 481
	i32 115, ; 482
	i32 47, ; 483
	i32 142, ; 484
	i32 117, ; 485
	i32 34, ; 486
	i32 174, ; 487
	i32 95, ; 488
	i32 53, ; 489
	i32 252, ; 490
	i32 129, ; 491
	i32 153, ; 492
	i32 24, ; 493
	i32 161, ; 494
	i32 229, ; 495
	i32 148, ; 496
	i32 104, ; 497
	i32 89, ; 498
	i32 217, ; 499
	i32 60, ; 500
	i32 142, ; 501
	i32 100, ; 502
	i32 5, ; 503
	i32 13, ; 504
	i32 122, ; 505
	i32 135, ; 506
	i32 28, ; 507
	i32 293, ; 508
	i32 72, ; 509
	i32 227, ; 510
	i32 24, ; 511
	i32 215, ; 512
	i32 256, ; 513
	i32 253, ; 514
	i32 310, ; 515
	i32 137, ; 516
	i32 208, ; 517
	i32 224, ; 518
	i32 168, ; 519
	i32 257, ; 520
	i32 289, ; 521
	i32 101, ; 522
	i32 123, ; 523
	i32 228, ; 524
	i32 184, ; 525
	i32 185, ; 526
	i32 163, ; 527
	i32 167, ; 528
	i32 231, ; 529
	i32 39, ; 530
	i32 196, ; 531
	i32 297, ; 532
	i32 178, ; 533
	i32 17, ; 534
	i32 171, ; 535
	i32 310, ; 536
	i32 309, ; 537
	i32 137, ; 538
	i32 150, ; 539
	i32 220, ; 540
	i32 155, ; 541
	i32 130, ; 542
	i32 19, ; 543
	i32 65, ; 544
	i32 147, ; 545
	i32 47, ; 546
	i32 317, ; 547
	i32 206, ; 548
	i32 79, ; 549
	i32 61, ; 550
	i32 106, ; 551
	i32 255, ; 552
	i32 210, ; 553
	i32 49, ; 554
	i32 241, ; 555
	i32 314, ; 556
	i32 252, ; 557
	i32 14, ; 558
	i32 183, ; 559
	i32 68, ; 560
	i32 171, ; 561
	i32 216, ; 562
	i32 220, ; 563
	i32 181, ; 564
	i32 319, ; 565
	i32 78, ; 566
	i32 225, ; 567
	i32 108, ; 568
	i32 209, ; 569
	i32 251, ; 570
	i32 67, ; 571
	i32 63, ; 572
	i32 27, ; 573
	i32 160, ; 574
	i32 218, ; 575
	i32 175, ; 576
	i32 10, ; 577
	i32 196, ; 578
	i32 11, ; 579
	i32 78, ; 580
	i32 126, ; 581
	i32 83, ; 582
	i32 186, ; 583
	i32 66, ; 584
	i32 107, ; 585
	i32 65, ; 586
	i32 128, ; 587
	i32 122, ; 588
	i32 77, ; 589
	i32 266, ; 590
	i32 256, ; 591
	i32 318, ; 592
	i32 8, ; 593
	i32 224, ; 594
	i32 2, ; 595
	i32 44, ; 596
	i32 269, ; 597
	i32 156, ; 598
	i32 128, ; 599
	i32 254, ; 600
	i32 23, ; 601
	i32 133, ; 602
	i32 212, ; 603
	i32 243, ; 604
	i32 313, ; 605
	i32 295, ; 606
	i32 29, ; 607
	i32 211, ; 608
	i32 202, ; 609
	i32 62, ; 610
	i32 198, ; 611
	i32 90, ; 612
	i32 87, ; 613
	i32 148, ; 614
	i32 191, ; 615
	i32 200, ; 616
	i32 36, ; 617
	i32 86, ; 618
	i32 232, ; 619
	i32 308, ; 620
	i32 303, ; 621
	i32 185, ; 622
	i32 50, ; 623
	i32 6, ; 624
	i32 90, ; 625
	i32 315, ; 626
	i32 21, ; 627
	i32 162, ; 628
	i32 96, ; 629
	i32 50, ; 630
	i32 113, ; 631
	i32 248, ; 632
	i32 130, ; 633
	i32 76, ; 634
	i32 27, ; 635
	i32 225, ; 636
	i32 247, ; 637
	i32 7, ; 638
	i32 197, ; 639
	i32 173, ; 640
	i32 110, ; 641
	i32 248, ; 642
	i32 234 ; 643
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 45bb7f365f1587a7786d5bbbf0daec075d5aabea"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
