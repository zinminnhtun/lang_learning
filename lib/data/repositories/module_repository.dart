import '../../core/models/lesson.dart';
import '../../core/models/module.dart';

class ModuleRepository {
  List<Module> fetchModules() {
    return [
      Module(
        id: 'module1',
        title: 'အခြေခံ နှုတ်ဆက်ခြင်း',
        description: 'နေ့စဉ်တွေ့ဆုံရာတွင် အသုံးပြုသည့် အခြေခံနှုတ်ဆက်စကား။',
        icon: '👋',
        lessons: [
          Lesson(id: 'lesson1', title: 'สวัสดีครับ/ค่ะ', subtitle: 'မင်္ဂလာပါ'),
        ],
      ),
      Module(
        id: 'module2',
        title: 'ကျေးဇူးတင်ကြောင်း ဖော်ပြခြင်း',
        description:
            'အကူအညီ သို့မဟုတ် ကောင်းမှုတစ်ခုအတွက် ကျေးဇူးတင်စကား ပြောဆိုခြင်း။',
        icon: '🙏',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ขอบคุณครับ/ค่ะ',
            subtitle: 'ကျေးဇူးတင်ပါတယ်',
          ),
        ],
      ),
      Module(
        id: 'module3',
        title: 'တောင်းပန်စကား ဆိုခြင်း',
        description:
            'အမှားတစ်ခုခုအတွက် သို့မဟုတ် အနှောင့်အယှက်ဖြစ်မှုအတွက် တောင်းပန်ခြင်း။',
        icon: '😔',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ขอโทษครับ/ค่ะ',
            subtitle: 'တောင်းပန်ပါတယ်',
          ),
        ],
      ),
      Module(
        id: 'module4',
        title: 'ဟုတ်ကဲ့ဟု ပြောဆိုခြင်း',
        description: 'သဘောတူညီကြောင်း သို့မဟုတ် အတည်ပြုကြောင်း ပြသသည့် စကား။',
        icon: '👍',
        lessons: [
          Lesson(id: 'lesson1', title: 'ใช่ครับ/ค่ะ', subtitle: 'ဟုတ်ကဲ့'),
        ],
      ),
      Module(
        id: 'module5',
        title: 'မဟုတ်ကြောင်း ငြင်းဆိုခြင်း',
        description: 'သဘောမတူညီကြောင်း သို့မဟုတ် အ否定ပြသည့် စကား။',
        icon: '👎',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ไม่ใช่ครับ/ค่ะ',
            subtitle: 'မဟုတ်ပါဘူး',
          ),
        ],
      ),
      Module(
        id: 'module6',
        title: 'နေကောင်းလား မေးမြန်းခြင်း',
        description: 'တစ်စုံတစ်ဦး၏ ကျန်းမာရေးအခြေအနေကို မေးမြန်းသည့် စကား။',
        icon: '😊',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'สบายดีไหมครับ/คะ',
            subtitle: 'နေကောင်းလား',
          ),
        ],
      ),
      Module(
        id: 'module7',
        title: 'မိမိအမည် ပြောကြားခြင်း',
        description: 'မိမိ၏အမည်ကို မိတ်ဆက်ပြောကြားသည့်အခါ အသုံးပြုသည်။',
        icon: '🗣️',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ผมชื่อ... / ฉันชื่อ...',
            subtitle: 'ကျွန်တော့်နာမည်... / ကျွန်မနာမည်...',
          ),
        ],
      ),
      Module(
        id: 'module8',
        title: 'စျေးဝယ်ရာတွင် ဈေးနှုန်းမေးခြင်း',
        description: 'ပစ္စည်းတစ်ခု၏ တန်ဖိုးကို မေးမြန်းသည့် စကား။',
        icon: '🛒',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'อันนี้เท่าไหร่ครับ/คะ',
            subtitle: 'ဒါဘယ်လောက်လဲ',
          ),
        ],
      ),
      Module(
        id: 'module9',
        title: 'အစားအစာ မှာယူခြင်း',
        description: 'စားသောက်ဆိုင်တွင် အစားအစာ မှာယူလိုကြောင်း ပြောဆိုခြင်း။',
        icon: '🍜',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'สั่งอาหารครับ/ค่ะ',
            subtitle: 'အစားအစာမှာချင်ပါတယ်',
          ),
        ],
      ),
      Module(
        id: 'module10',
        title: 'ရေတောင်းခြင်း',
        description: 'သောက်သုံးရန် ရေတောင်းဆိုသည့် စကား။',
        icon: '💧',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ขอน้ำดื่มหน่อยครับ/ค่ะ',
            subtitle: 'သောက်ရေหน่อย တောင်းပါ',
          ),
        ],
      ),
      Module(
        id: 'module11',
        title: 'အစပ်မใส่ရန် ပြောဆိုခြင်း',
        description: 'အစားအစာတွင် အစပ်မထည့်ရန် တောင်းဆိုခြင်း။',
        icon: '🌶️',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ไม่ใส่พริกครับ/ค่ะ',
            subtitle: 'ငရုတ်သီးမထည့်ပါနဲ့',
          ),
        ],
      ),
      Module(
        id: 'module12',
        title: 'စားကောင်းကြောင်း ပြောဆိုခြင်း',
        description: 'အစားအစာ၏ အရသာကို ချီးကျူးသည့် စကား။',
        icon: '😋',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'อร่อยมากครับ/ค่ะ',
            subtitle: 'အရမ်းစားလို့ကောင်းတယ်',
          ),
        ],
      ),
      Module(
        id: 'module13',
        title: 'ငွေရှင်းရန် တောင်းဆိုခြင်း',
        description: 'စားသောက်ပြီးနောက် ငွေရှင်းရန် ပြောဆိုခြင်း။',
        icon: '💰',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'คิดเงินด้วยครับ/ค่ะ',
            subtitle: 'ရှင်းမယ်',
          ),
        ],
      ),
      Module(
        id: 'module14',
        title: 'လမ်းညွှန်မေးမြန်းခြင်း (ဘယ်မှာလဲ)',
        description: 'နေရာတစ်ခု၏ တည်နေရာကို မေးမြန်းခြင်း။',
        icon: '🗺️',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: '...อยู่ที่ไหนครับ/คะ',
            subtitle: '...ဘယ်မှာလဲ',
          ),
        ],
      ),
      Module(
        id: 'module15',
        title: 'တည့်တည့်သွားရန် လမ်းညွှန်ခြင်း',
        description: 'ရှေ့သို့တည့်တည့်သွားရန် လမ်းညွှန်บอกကြားခြင်း။',
        icon: '⬆️',
        lessons: [
          Lesson(id: 'lesson1', title: 'ตรงไป', subtitle: 'တည့်တည့်သွားပါ'),
        ],
      ),
      Module(
        id: 'module16',
        title: 'ဘယ်ဘက်ကွေ့ရန် လမ်းညွှန်ခြင်း',
        description: 'ဘယ်ဘက်သို့ကွေ့ရန် လမ်းညွှန်บอกကြားခြင်း။',
        icon: '⬅️',
        lessons: [
          Lesson(id: 'lesson1', title: 'เลี้ยวซ้าย', subtitle: 'ဘယ်ဘက်ကွေ့ပါ'),
        ],
      ),
      Module(
        id: 'module17',
        title: 'ညာဘက်ကွေ့ရန် လမ်းညွှန်ခြင်း',
        description: 'ညာဘက်သို့ကွေ့ရန် လမ်းညွှန်บอกကြားခြင်း။',
        icon: '➡️',
        lessons: [
          Lesson(id: 'lesson1', title: 'เลี้ยวขวา', subtitle: 'ညာဘက်ကွေ့ပါ'),
        ],
      ),
      Module(
        id: 'module18',
        title: 'အလုပ်ပြီးကြောင်း ပြောဆိုခြင်း',
        description: 'လုပ်ငန်းတာဝန်တစ်ခု ပြီးဆုံးကြောင်း အသိပေးခြင်း။',
        icon: '✅',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'เสร็จแล้วครับ/ค่ะ',
            subtitle: 'ပြီးပါပြီ',
          ),
        ],
      ),
      Module(
        id: 'module19',
        title: 'အကူအညီတောင်းခြင်း',
        description: 'အလုပ် သို့မဟုတ် အခြေအနေတစ်ခုအတွက် အကူအညီတောင်းဆိုခြင်း။',
        icon: '🆘',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ช่วยด้วยครับ/ค่ะ',
            subtitle: 'ကူညီပါဦး',
          ),
        ],
      ),
      Module(
        id: 'module20',
        title: 'နားလည်ကြောင်း ပြောဆိုခြင်း',
        description: 'ပြောဆိုသည့်အကြောင်းအရာကို နားလည်ကြောင်း တုံ့ပြန်ခြင်း။',
        icon: '👌',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'เข้าใจแล้วครับ/ค่ะ',
            subtitle: 'နားလည်ပါပြီ',
          ),
        ],
      ),
      Module(
        id: 'module21',
        title: 'နားမလည်ကြောင်း ပြောဆိုခြင်း',
        description: 'ပြောဆိုသည့်အကြောင်းအရာကို နားမလည်ကြောင်း တုံ့ပြန်ခြင်း။',
        icon: '❓',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ไม่เข้าใจครับ/ค่ะ',
            subtitle: 'နားမလည်ပါဘူး',
          ),
        ],
      ),
      Module(
        id: 'module22',
        title: 'နေမကောင်းကြောင်း ပြောဆိုခြင်း',
        description: 'မိမိ၏ကျန်းမာရေးအခြေအနေ မကောင်းကြောင်း အသိပေးခြင်း။',
        icon: '🤒',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ไม่สบายครับ/ค่ะ',
            subtitle: 'နေမကောင်းဘူး',
          ),
        ],
      ),
      Module(
        id: 'module23',
        title: 'ဆေးရုံသွားရန် လိုအပ်ကြောင်း',
        description: 'ဆေးရုံသို့ သွားရောက်ရန် လိုအပ်ကြောင်း ပြောဆိုခြင်း။',
        icon: '🏥',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'อยากไปโรงพยาบาลครับ/ค่ะ',
            subtitle: 'ဆေးရုံသွားချင်ပါတယ်',
          ),
        ],
      ),
      Module(
        id: 'module24',
        title: 'အချိန်မေးမြန်းခြင်း',
        description: 'လက်ရှိအချိန်ကို မေးမြန်းသည့် စကား။',
        icon: '⏰',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ตอนนี้กี่โมงแล้วครับ/คะ',
            subtitle: 'အခုဘယ်နှနာရီရှိပြီလဲ',
          ),
        ],
      ),
      Module(
        id: 'module25',
        title: 'ယနေ့ဟု ပြောဆိုခြင်း',
        description: 'လက်ရှိနေ့ကို ရည်ညွှန်းသည့် စကား။',
        icon: '📅',
        lessons: [Lesson(id: 'lesson1', title: 'วันนี้', subtitle: 'ဒီနေ့')],
      ),
      Module(
        id: 'module26',
        title: 'မနက်ဖြန်ဟု ပြောဆိုခြင်း',
        description: 'နောက်နေ့ကို ရည်ညွှန်းသည့် စကား။',
        icon: '🗓️',
        lessons: [
          Lesson(id: 'lesson1', title: 'พรุ่งนี้', subtitle: 'မနက်ဖြန်'),
        ],
      ),
      Module(
        id: 'module27',
        title: 'တွေ့ရတာဝမ်းသာကြောင်း ပြောဆိုခြင်း',
        description:
            'တစ်စုံတစ်ဦးနှင့် တွေ့ဆုံရသည့်အတွက် ဝမ်းမြောက်ကြောင်း ဖော်ပြခြင်း။',
        icon: '🤝',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ยินดีที่ได้รู้จักครับ/ค่ะ',
            subtitle: 'တွေ့ရတာဝမ်းသာပါတယ်',
          ),
        ],
      ),
      Module(
        id: 'module28',
        title: 'နောက်မှတွေ့မည်ဟု နှုတ်ဆက်ခြင်း',
        description: 'နောက်တစ်ကြိမ် ပြန်လည်တွေ့ဆုံရန် နှုတ်ဆက်စကား ဆိုခြင်း။',
        icon:
            'ㅂ', // Using a generic wave symbol if specific emoji is unavailable
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'แล้วพบกันใหม่นะครับ/นะคะ',
            subtitle: 'နောက်မှတွေ့ကြတာပေါ့',
          ),
        ],
      ),
      Module(
        id: 'module29',
        title: 'ဖြည်းဖြည်းပြောရန် တောင်းဆိုခြင်း',
        description: 'စကားကို ဖြည်းဖြည်းပြောပေးရန် မေတ္တာရပ်ခံခြင်း။',
        icon: '🐢',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'พูดช้าๆ หน่อยครับ/ค่ะ',
            subtitle: 'ဖြည်းဖြည်းပြောပေးပါ',
          ),
        ],
      ),
      Module(
        id: 'module30',
        title: 'တစ်ခုခု ရှာဖွေနေကြောင်း ပြောဆိုခြင်း',
        description:
            'မိမိရှာဖွေနေသည့် ပစ္စည်း သို့မဟုတ် နေရာကို မေးမြန်းခြင်း။',
        icon: '🔍',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'กำลังมองหา...อยู่ครับ/ค่ะ',
            subtitle: '...ကို ရှာနေတာပါ',
          ),
        ],
      ),
      Module(
        id: 'module31',
        title: 'ဟိုတယ်တွင် Check-in လုပ်ခြင်း',
        description:
            'ဟိုတယ်သို့ ရောက်ရှိကြောင်း အကြောင်းကြား၍ အခန်းတောင်းခံခြင်း။',
        icon: '🛎️',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'เช็คอินครับ/ค่ะ',
            subtitle: 'Check-in လုပ်ချင်ပါတယ်',
          ),
        ],
      ),
      Module(
        id: 'module32',
        title: 'ဒါဘာလဲဟု မေးမြန်းခြင်း',
        description: 'မသိသည့်အရာတစ်ခုကို ညွှန်ပြ၍ မေးမြန်းခြင်း။',
        icon: '🤔',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'อันนี้คืออะไรครับ/คะ',
            subtitle: 'ဒါဘာလဲခင်ဗျ/ရှင့်',
          ),
        ],
      ),
      Module(
        id: 'module33',
        title: 'ရေချိုးခန်း ဘယ်မှာလဲ မေးခြင်း',
        description:
            'အများသုံး သို့မဟုတ် ကိုယ်ပိုင်ရေချိုးခန်းတည်နေရာ မေးမြန်းခြင်း။',
        icon: '🚻',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ห้องน้ำอยู่ที่ไหนครับ/คะ',
            subtitle: 'ရေချိုးခန်း ဘယ်မှာလဲ',
          ),
        ],
      ),
      Module(
        id: 'module34',
        title: 'အလုပ်သွားကြောင်း ပြောဆိုခြင်း',
        description: 'အလုပ်ခွင်သို့ သွားရောက်နေကြောင်း အသိပေးခြင်း။',
        icon: '💼',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ไปทำงานครับ/ค่ะ',
            subtitle: 'အလုပ်သွားမလို့ပါ',
          ),
        ],
      ),
      Module(
        id: 'module35',
        title: 'စျေးသွားကြောင်း ပြောဆိုခြင်း',
        description: 'စျေးဝယ်ရန် သွားရောက်နေကြောင်း အသိပေးခြင်း။',
        icon: '🛍️',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ไปตลาดครับ/ค่ะ',
            subtitle: 'ဈေးသွားမလို့ပါ',
          ),
        ],
      ),
      Module(
        id: 'module36',
        title: 'ဖုန်းနံပါတ် တောင်းခြင်း',
        description: 'ဆက်သွယ်ရန်အတွက် ဖုန်းနံပါတ် တောင်းဆိုခြင်း။',
        icon: '📱',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ขอเบอร์โทรศัพท์หน่อยได้ไหมครับ/คะ',
            subtitle: 'ဖုန်းနံပါတ်လေး တောင်းလို့ရမလား',
          ),
        ],
      ),
      Module(
        id: 'module37',
        title: 'ခဏစောင့်ရန် ပြောဆိုခြင်း',
        description: 'တစ်စုံတစ်ဦးအား ခေတ္တစောင့်ဆိုင်းရန် ပြောကြားခြင်း။',
        icon: '⏳',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'รอสักครู่นะครับ/นะคะ',
            subtitle: 'ခဏစောင့်ပေးပါ',
          ),
        ],
      ),
      Module(
        id: 'module38',
        title: 'အလွန်ပူကြောင်း ပြောဆိုခြင်း',
        description:
            'ရာသီဥတု သို့မဟုတ် အရာဝတ္ထုတစ်ခု အလွန်ပူကြောင်း ဖော်ပြခြင်း။',
        icon: '☀️',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ร้อนมากครับ/ค่ะ',
            subtitle: 'အရမ်းပူတယ်',
          ),
        ],
      ),
      Module(
        id: 'module39',
        title: 'အလွန်အေးကြောင်း ပြောဆိုခြင်း',
        description:
            'ရာသီဥတု သို့မဟုတ် အရာဝတ္ထုတစ်ခု အလွန်အေးကြောင်း ဖော်ပြခြင်း။',
        icon: '❄️',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'หนาวมากครับ/ค่ะ',
            subtitle: 'အရမ်းအေးတယ်',
          ),
        ],
      ),
      Module(
        id: 'module40',
        title: 'ဗိုက်ဆာကြောင်း ပြောဆိုခြင်း',
        description: 'အစားအစာ စားသုံးလိုစိတ်ရှိကြောင်း ဖော်ပြခြင်း။',
        icon: '🍔',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'หิวข้าวครับ/ค่ะ',
            subtitle: 'ဗိုက်ဆာတယ်',
          ),
        ],
      ),
      Module(
        id: 'module41',
        title: 'ရေဆာကြောင်း ပြောဆိုခြင်း',
        description: 'ရေသောက်သုံးလိုစိတ်ရှိကြောင်း ဖော်ပြခြင်း။',
        icon: '🥤',
        lessons: [
          Lesson(id: 'lesson1', title: 'หิวน้ำครับ/ค่ะ', subtitle: 'ရေဆာတယ်'),
        ],
      ),
      Module(
        id: 'module42',
        title: 'ပင်ပန်းကြောင်း ပြောဆိုခြင်း',
        description: 'ကိုယ်လက်ပင်ပန်းနွမ်းနယ်နေကြောင်း ဖော်ပြခြင်း။',
        icon: '😩',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'เหนื่อยมากครับ/ค่ะ',
            subtitle: 'အရမ်းပင်ပန်းတယ်',
          ),
        ],
      ),
      Module(
        id: 'module43',
        title: 'အိပ်ချင်ကြောင်း ပြောဆိုခြင်း',
        description: 'အိပ်စက်အနားယူလိုစိတ်ရှိကြောင်း ဖော်ပြခြင်း။',
        icon: '😴',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ง่วงนอนครับ/ค่ะ',
            subtitle: 'အိပ်ချင်တယ်',
          ),
        ],
      ),
      Module(
        id: 'module44',
        title: 'ဘယ်ကလာသလဲ မေးမြန်းခြင်း',
        description:
            'တစ်စုံတစ်ဦး၏ ဇာတိ သို့မဟုတ် နေရပ်လိပ်စာကို မေးမြန်းခြင်း။',
        icon: '🌏',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'มาจากที่ไหนครับ/คะ',
            subtitle: 'ဘယ်ကလာတာလဲ',
          ),
        ],
      ),
      Module(
        id: 'module45',
        title: 'အသက်မေးမြန်းခြင်း',
        description: 'တစ်စုံတစ်ဦး၏ အသက်ကို မေးမြန်းသည့် စကား။',
        icon: '🎂',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'อายุเท่าไหร่ครับ/คะ',
            subtitle: 'အသက်ဘယ်လောက်ရှိပြီလဲ',
          ),
        ],
      ),
      Module(
        id: 'module46',
        title: 'ဓာတ်ပုံရိုက်ခွင့် တောင်းခြင်း',
        description:
            'တစ်စုံတစ်ဦး သို့မဟုတ် တစ်စုံတစ်ခုကို ဓာတ်ပုံရိုက်ရန် ခွင့်တောင်းခြင်း။',
        icon: '📸',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ถ่ายรูปได้ไหมครับ/คะ',
            subtitle: 'ဓာတ်ပုံရိုက်လို့ရမလား',
          ),
        ],
      ),
      Module(
        id: 'module47',
        title: 'အကူအညီ လိုအပ်ပါသလားဟု မေးခြင်း',
        description: 'တစ်စုံတစ်ဦးအား အကူအညီ လိုအပ်မှုရှိမရှိ မေးမြန်းခြင်း။',
        icon: '🤝',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ให้ช่วยอะไรไหมครับ/คะ',
            subtitle: 'ဘာအကူအညီပေးရမလဲ',
          ),
        ],
      ),
      Module(
        id: 'module48',
        title: 'ကိစ္စမရှိကြောင်း ပြောဆိုခြင်း',
        description:
            'တောင်းပန်စကား သို့မဟုတ် ကျေးဇူးတင်စကားကို တုံ့ပြန်သည့်အနေဖြင့် ပြောဆိုခြင်း။',
        icon: '🤷',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ไม่เป็นไรครับ/ค่ะ',
            subtitle: 'ကိစ္စမရှိပါဘူး',
          ),
        ],
      ),
      Module(
        id: 'module49',
        title: 'ယာဉ်စီးခ မေးမြန်းခြင်း',
        description: 'သယ်ယူပို့ဆောင်ရေးယာဉ်အတွက် စီးနင်းခကို မေးမြန်းခြင်း။',
        icon: '🚕',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ค่าโดยสารเท่าไหร่ครับ/คะ',
            subtitle: 'ကားခဘယ်လောက်လဲ',
          ),
        ],
      ),
      Module(
        id: 'module50',
        title: 'အောင်မြင်ပါစေကြောင်း ဆုတောင်းခြင်း',
        description:
            'တစ်စုံတစ်ဦး၏ ကြိုးပမ်းမှုအတွက် အောင်မြင်စေရန် ဆုမွန်ကောင်းတောင်းခြင်း။',
        icon: '🎉',
        lessons: [
          Lesson(
            id: 'lesson1',
            title: 'ขอให้โชคดีนะครับ/นะคะ',
            subtitle: 'ကံကောင်းပါစေ',
          ),
        ],
      ),
    ];
  }
}
