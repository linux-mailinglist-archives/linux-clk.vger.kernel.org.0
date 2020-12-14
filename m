Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C292D95AC
	for <lists+linux-clk@lfdr.de>; Mon, 14 Dec 2020 11:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394910AbgLNJ74 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 14 Dec 2020 04:59:56 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2090 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394863AbgLNJ7u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Dec 2020 04:59:50 -0500
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CvcJr5tJ4zVpFh;
        Mon, 14 Dec 2020 17:58:04 +0800 (CST)
Received: from [10.140.157.68] (10.140.157.68) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 14 Dec 2020 17:59:04 +0800
Subject: Re: [PATCH RESEND v6 3/4] dt: bindings: dma: Add DT bindings for
 HiSilicon Hiedma Controller
To:     Rob Herring <robh@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <dan.j.williams@intel.com>,
        <dmaengine@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <vkoul@kernel.org>, <mturquette@baylibre.com>
References: <20201212131115.569-1-gengdongjiu@huawei.com>
 <20201212131115.569-4-gengdongjiu@huawei.com>
 <20201211205706.GA906538@robh.at.kernel.org>
From:   Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <3dc33423-5cc0-9306-bf59-1b396b57370d@huawei.com>
Date:   Mon, 14 Dec 2020 17:59:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20201211205706.GA906538@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: base64
X-Originating-IP: [10.140.157.68]
X-ClientProxiedBy: dggeme703-chm.china.huawei.com (10.1.199.99) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMjAyMC8xMi8xMiA0OjU3LCBSb2IgSGVycmluZyB3cm90ZToNCj4gT24gU2F0LCAxMiBE
ZWMgMjAyMCAxMzoxMToxNCArMDAwMCwgRG9uZ2ppdSBHZW5nIHdyb3RlOg0KPj4gVGhlIEhp
ZWRtYSBDb250cm9sbGVyIHYzMTAgUHJvdmlkZXMgZWlnaHQgRE1BIGNoYW5uZWxzLCBlYWNo
DQo+PiBjaGFubmVsIGNhbiBiZSBjb25maWd1cmVkIGZvciBvbmUtd2F5IHRyYW5zZmVyLiBU
aGUgZGF0YSBjYW4NCj4+IGJlIHRyYW5zZmVycmVkIGluIDgtYml0LCAxNi1iaXQsIDMyLWJp
dCwgb3IgNjQtYml0IG1vZGUuIFRoaXMNCj4+IGRvY3VtZW50YXRpb24gZGVzY3JpYmVzIERU
IGJpbmRpbmdzIG9mIHRoaXMgY29udHJvbGxlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBE
b25naml1IEdlbmcgPGdlbmdkb25naml1QGh1YXdlaS5jb20+DQo+PiAtLS0NCj4+ICAuLi4v
YmluZGluZ3MvZG1hL2hpc2lsaWNvbixoaWVkbWFjdjMxMC55YW1sICAgfCA5NCArKysrKysr
KysrKysrKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDk0IGluc2VydGlvbnMoKykNCj4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9oaXNpbGljb24saGllZG1hY3YzMTAueWFtbA0KPj4NCj4gDQo+IA0KPiBNeSBib3Qg
Zm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91ciBw
YXRjaDoNCj4gDQo+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCj4gDQo+IGR0c2NoZW1h
L2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1y
ZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9oaXNpbGljb24s
aGllZG1hY3YzMTAuZXhhbXBsZS5kdC55YW1sOiBkbWEtY29udHJvbGxlckAxMDA0MDAwMDog
J2hpc2ksbWlzYy1jb250cm9sJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6
ICdeIy4qJywgJ14oYXQyNXxkZXZidXN8ZG1hY2FwfGRzYXxleHlub3N8ZnNpW2FiXXxncGlv
LWZhbnxncGlvfGdwbWN8aGRtaXxpMmMtZ3BpbyksLionLCAnXihrZXlwYWR8bTI1cHxtYXg4
OTUyfG1heDg5OTd8bWF4ODk5OHxtcG1jKSwuKicsICdeKHBpbmN0cmwtc2luZ2xlfCNwaW5j
dHJsLXNpbmdsZXxQb3dlclBDKSwuKicsICdeKHBsMDIyfHB4YS1tbWN8cmNhcl9zb3VuZHxy
b3RhcnktZW5jb2RlcnxzNW04NzY3fHNkaGNpKSwuKicsICdeKHNpbXBsZS1hdWRpby1jYXJk
fHN0LXBsZ3Bpb3xzdC1zcGljc3x0cyksLionLCAnXjcwbWFpLC4qJywgJ15HRUZhbnVjLC4q
JywgJ15PUkNMLC4qJywgJ15TVU5XLC4qJywgJ15bYS16QS1aMC05I19dW2EtekEtWjAtOStc
XC0uX0BdezAsNjN9JCcsICdeW2EtekEtWjAtOStcXC0uX10qQFswLTlhLXpBLVosXSokJywg
J15hYmlsaXMsLionLCAnXmFicmFjb24sLionLCAnXmFjZXIsLionLCAnXmFjbWUsLionLCAn
XmFjdGlvbnMsLionLCAnXmFjdGl2ZS1zZW1pLC4qJywgJ15hZCwuKicsICdeYWRhZnJ1aXQs
LionLCAnXmFkYXB0ZXZhLC4qJywgJ15hZGFwdHJ1bSwuKicsICdeYWRoLC4qJywgJ15hZGks
LionLCAnXmFkdmFudGVjaCwuKicsICdeYWVyb2ZsZXhnYWlzbGVyLC4qJywgJ15hbCwuKics
ICdeYWxsZWdybywuKicsICdeYWxsbywuKicsICdeYWxsd2lubmVyLC4qJywgJ15hbHBoYXNj
YWxlLC4qJywgJ15hbHBzLC4qJywgJ15hbHRyLC4qJywgJ15hbWFydWxhLC4qJywgJ15hbWF6
b24sLionLCAnXmFtY2MsLionLCAnXmFtZCwuKicsICdeYW1lZGlhdGVjaCwuKicsICdeYW1s
b2dpYywuKicsICdeYW1waXJlLC4qJywgJ15hbXMsLionLCAnXmFtc3Rhb3MsLionLCAnXmFu
YWxvZ2l4LC4qJywgJ15hbmRlc3RlY2gsLionLCAnXmFudm8sLionLCAnXmFwbSwuKicsICde
YXB0aW5hLC4qJywgJ15hcmFzYW4sLionLCAnXmFyY2hlcm1pbmQsLionLCAnXmFyY3RpYywu
KicsICdeYXJjeCwuKicsICdeYXJpZXMsLionLCAnXmFybSwuKicsICdeYXJtYWRldXMsLion
LCAnXmFycm93LC4qJywgJ15hcnRlc3luLC4qJywgJ15hc2FoaS1rYXNlaSwuKicsICdeYXNj
LC4qJywgJ15hc3BlZWQsLionLCAnXmFzdXMsLionLCAnXmF0bGFzLC4qJywgJ15hdG1lbCwu
KicsICdeYXVvLC4qJywgJ15hdXZpZGVhLC4qJywgJ15hdmFnbywuKicsICdeYXZpYSwuKics
ICdeYXZpYywuKicsICdeYXZuZXQsLionLCAnXmF3aW5pYywuKicsICdeYXhlbnRpYSwuKics
ICdeYXhpcywuKicsICdeYXpvdGVxLC4qJywgJ15hencsLionLCAnXmJhaWthbCwuKicsICde
YmFuYW5hcGksLionLCAnXmJlYWNvbiwuKicsICdeYmVhZ2xlLC4qJywgJ15iaGYsLionLCAn
XmJpdG1haW4sLionLCAnXmJvZSwuKicsICdeYm9zY2gsLionLCAnXmJvdW5kYXJ5LC4qJywg
J15icmNtLC4qJywgJ15icm9hZG1vYmksLionLCAnXmJ0aWNpbm8sLionLCAnXmJ1ZmZhbG8s
LionLCAnXmJ1ciwuKicsICdeY2FsYW9zeXN0ZW1zLC4qJywgJ15jYWx4ZWRhLC4qJywgJ15j
YW5pbm9zLC4qJywgJ15jYXBlbGxhLC4qJywgJ15jYXNjb2RhLC4qJywgJ15jYXRhbHlzdCwu
KicsICdeY2F2aXVtLC4qJywgJ15jZG5zLC4qJywgJ15jZHRlY2gsLionLCAnXmNlbGx3aXNl
LC4qJywgJ15jZXZhLC4qJywgJ15jaGVja3BvaW50LC4qJywgJ15jaGVmcmVlLC4qJywgJ15j
aGlwaWRlYSwuKicsICdeY2hpcG9uZSwuKicsICdeY2hpcHNwYXJrLC4qJywgJ15jaHJvbnRl
bCwuKicsICdeY2hycCwuKicsICdeY2h1bmdod2EsLionLCAnXmNodXdpLC4qJywgJ15jaWFh
LC4qJywgJ15jaXJydXMsLionLCAnXmNsb3VkZW5naW5lcywuKicsICdeY25tLC4qJywgJ15j
bnh0LC4qJywgJ15jb2xvcmZseSwuKicsICdeY29tcHVsYWIsLionLCAnXmNvcmVyaXZlciwu
KicsICdeY29ycHJvLC4qJywgJ15jb3J0aW5hLC4qJywgJ15jb3NtaWMsLionLCAnXmNyYW5l
LC4qJywgJ15jcmVhdGl2ZSwuKicsICdeY3J5c3RhbGZvbnR6LC4qJywgJ15jc2t5LC4qJywg
J15jc3EsLionLCAnXmN1YmlldGVjaCwuKicsICdeY3lwcmVzcywuKicsICdeY3puaWMsLion
LCAnXmRhbGxhcywuKicsICdeZGF0YWltYWdlLC4qJywgJ15kYXZpY29tLC4qJywgJ15kZWxs
LC4qJywgJ15kZWx0YSwuKicsICdeZGVueCwuKicsICdeZGV2YW50ZWNoLC4qJywgJ15kZmks
LionLCAnXmRoLC4qJywgJ15kaWZybmNlLC4qJywgJ15kaWdpLC4qJywgJ15kaWdpbGVudCwu
KicsICdeZGlvbywuKicsICdeZGxjLC4qJywgJ15kbGcsLionLCAnXmRsaW5rLC4qJywgJ15k
bW8sLionLCAnXmRvbWludGVjaCwuKicsICdeZG9uZ3dvb24sLionLCAnXmRwdGVjaG5pY3Ms
LionLCAnXmRyYWdpbm8sLionLCAnXmRzZXJ2ZSwuKicsICdeZHluYWltYWdlLC4qJywgJ15l
YSwuKicsICdeZWJzLXN5c3RhcnQsLionLCAnXmVidiwuKicsICdeZWNrZWxtYW5uLC4qJywg
J15lZHQsLionLCAnXmVldGksLionLCAnXmVpbmZvY2hpcHMsLionLCAnXmVsYW4sLionLCAn
XmVsZ2luLC4qJywgJ15lbGlkYSwuKicsICdeZW1iZXN0LC4qJywgJ15lbWxpZCwuKicsICde
ZW1taWNybywuKicsICdeZW1waXJlLWVsZWN0cm9uaXgsLionLCAnXmVtdHJpb24sLionLCAn
XmVuZGxlc3MsLionLCAnXmVuZSwuKicsICdeZW5lcmd5bWljcm8sLionLCAnXmVuZ2ljYW0s
LionLCAnXmVwY29zLC4qJywgJ15lcGZsLC4qJywgJ15lcHNvbiwuKicsICdeZXNwLC4qJywg
J15lc3QsLionLCAnXmV0dHVzLC4qJywgJ15ldWtyZWEsLionLCAnXmV2ZXJlc3QsLionLCAn
XmV2ZXJzcGluLC4qJywgJ15ldmVydmlzaW9uLC4qJywgJ15leGFyLC4qJywgJ15leGNpdG8s
LionLCAnXmV6Y2hpcCwuKicsICdeZmFjZWJvb2ssLionLCAnXmZhaXJwaG9uZSwuKicsICde
ZmFyYWRheSwuKicsICdeZmFzdHJheCwuKicsICdeZmNzLC4qJywgJ15mZWl4aW4sLionLCAn
XmZlaXlhbmcsLionLCAnXmZpcmVmbHksLionLCAnXmZvY2FsdGVjaCwuKicsICdeZnJpZGEs
LionLCAnXmZyaWVuZGx5YXJtLC4qJywgJ15mc2wsLionLCAnXmZ1aml0c3UsLionLCAnXmdh
cmRlbmEsLionLCAnXmdhdGV3b3JrcywuKicsICdeZ2N3LC4qJywgJ15nZSwuKicsICdeZ2Vl
a2J1eWluZywuKicsICdeZ2VmLC4qJywgJ15nZW1laSwuKicsICdeZ2VuaWF0ZWNoLC4qJywg
J15naWFudGVjLC4qJywgJ15naWFudHBsdXMsLionLCAnXmdsb2JhbHNjYWxlLC4qJywgJ15n
bG9iYWx0b3AsLionLCAnXmdtdCwuKicsICdeZ29vZGl4LC4qJywgJ15nb29nbGUsLionLCAn
XmdyaW5uLC4qJywgJ15ncm1uLC4qJywgJ15ndW1zdGl4LC4qJywgJ15ndywuKicsICdeaGFu
bnN0YXIsLionLCAnXmhhb3l1LC4qJywgJ15oYXJka2VybmVsLC4qJywgJ15oaWRlZXAsLion
LCAnXmhpbWF4LC4qJywgJ15oaXNpbGljb24sLionLCAnXmhpdCwuKicsICdeaGl0ZXgsLion
LCAnXmhvbHQsLionLCAnXmhvbHRlaywuKicsICdeaG9uZXl3ZWxsLC4qJywgJ15ob3BlcnVu
LC4qJywgJ15ocCwuKicsICdeaHNnLC4qJywgJ15odWdzdW4sLionLCAnXmh3YWNvbSwuKics
ICdeaHlkaXMsLionLCAnXmh5dW5kYWksLionLCAnXmkyc2UsLionLCAnXmlibSwuKicsICde
aWNwbHVzLC4qJywgJ15pZHQsLionLCAnXmlmaSwuKicsICdeaWxpdGVrLC4qJywgJ15pbWcs
LionLCAnXmltaSwuKicsICdeaW5jaXJjdWl0LC4qJywgJ15pbmV0LXRlaywuKicsICdeaW5m
aW5lb24sLionLCAnXmluZm9yY2UsLionLCAnXmluZ2VuaWMsLionLCAnXmlubm9sdXgsLion
LCAnXmluc2lkZS1zZWN1cmUsLionLCAnXmluc3B1ciwuKicsICdeaW50ZWwsLionLCAnXmlu
dGVyY29udHJvbCwuKicsICdeaW52ZW5zZW5zZSwuKicsICdeaW52ZXJzZXBhdGgsLionLCAn
XmlvbSwuKicsICdeaXNlZSwuKicsICdeaXNpbCwuKicsICdeaXNzaSwuKicsICdeaXRlLC4q
JywgJ15pdGVhZCwuKicsICdeaXZvLC4qJywgJ15pd2F2ZSwuKicsICdeamRpLC4qJywgJ15q
ZWRlYywuKicsICdeamVzdXJ1biwuKicsICdeamlhbmRhLC4qJywgJ15rYW0sLionLCAnXmth
cm8sLionLCAnXmtlaXRoa29lcCwuKicsICdea2V5bWlsZSwuKicsICdea2hhZGFzLC4qJywg
J15raWViYWNrcGV0ZXIsLionLCAnXmtpbmV0aWMsLionLCAnXmtpbmdkaXNwbGF5LC4qJywg
J15raW5nbm92ZWwsLionLCAnXmtpb25peCwuKicsICdea29ibywuKicsICdea29lLC4qJywg
J15rb250cm9uLC4qJywgJ15rb3NhZ2ksLionLCAnXmt5bywuKicsICdebGFjaWUsLionLCAn
XmxhaXJkLC4qJywgJ15sYW1vYm8sLionLCAnXmxhbnRpcSwuKicsICdebGF0dGljZSwuKics
ICdebGVhZHRlaywuKicsICdebGVleiwuKicsICdebGVnbywuKicsICdebGVtYWtlciwuKics
ICdebGVub3ZvLC4qJywgJ15sZywuKicsICdebGdwaGlsaXBzLC4qJywgJ15saWJyZXRlY2gs
LionLCAnXmxpY2hlZXBpLC4qJywgJ15saW5hcm8sLionLCAnXmxpbmtzcHJpdGUsLionLCAn
XmxpbmtzeXMsLionLCAnXmxpbnV0cm9uaXgsLionLCAnXmxpbnV4LC4qJywgJ15saW54LC4q
JywgJ15sbHRjLC4qJywgJ15sb2dpY3BkLC4qJywgJ15sb2dpY3RlY2hubywuKicsICdebG9u
Z2NoZWVyLC4qJywgJ15sb250aXVtLC4qJywgJ15sb29uZ3NvbiwuKicsICdebHNpLC4qJywg
J15sd24sLionLCAnXmx4YSwuKicsICdebWFjbmljYSwuKicsICdebWFudGl4LC4qJywgJ15t
YXBsZWJvYXJkLC4qJywgJ15tYXJ2ZWxsLC4qJywgJ15tYXhib3RpeCwuKicsICdebWF4aW0s
LionLCAnXm1idmwsLionLCAnXm1jdWJlLC4qJywgJ15tZWFzLC4qJywgJ15tZWNlciwuKics
ICdebWVkaWF0ZWssLionLCAnXm1lZ2FjaGlwcywuKicsICdebWVsZSwuKicsICdebWVsZXhp
cywuKicsICdebWVsZmFzLC4qJywgJ15tZWxsYW5veCwuKicsICdebWVtc2ljLC4qJywgJ15t
ZW5sbywuKicsICdebWVyYWtpLC4qJywgJ15tZXJyaWksLionLCAnXm1pY3JlbCwuKicsICde
bWljcm9jaGlwLC4qJywgJ15taWNyb2NyeXN0YWwsLionLCAnXm1pY3JvbiwuKicsICdebWlj
cm9zb2Z0LC4qJywgJ15taWtyb2UsLionLCAnXm1pa3JvdGlrLC4qJywgJ15taW5pYW5kLC4q
JywgJ15taW5peCwuKicsICdebWlyYW1lbXMsLionLCAnXm1pdHN1YmlzaGksLionLCAnXm1v
c2FpeHRlY2gsLionLCAnXm1vdG9yb2xhLC4qJywgJ15tb3hhLC4qJywgJ15tcGwsLionLCAn
Xm1wcywuKicsICdebXFtYWtlciwuKicsICdebXJ2bCwuKicsICdebXNjYywuKicsICdebXNp
LC4qJywgJ15tc3RhciwuKicsICdebXRpLC4qJywgJ15tdWx0aS1pbm5vLC4qJywgJ15tdW5k
b3JlYWRlciwuKicsICdebXVyYXRhLC4qJywgJ15teGljeSwuKicsICdebXlpciwuKicsICde
bmF0aW9uYWwsLionLCAnXm5lYywuKicsICdebmVvbm9kZSwuKicsICdebmV0Z2VhciwuKics
ICdebmV0bG9naWMsLionLCAnXm5ldHJvbi1keSwuKicsICdebmV0eGVvbiwuKicsICdebmV3
ZWFzdCwuKicsICdebmV3aGF2ZW4sLionLCAnXm5leGJveCwuKicsICdebmV4dHRoaW5nLC4q
JywgJ15uaSwuKicsICdebmludGVuZG8sLionLCAnXm5sdCwuKicsICdebm9raWEsLionLCAn
Xm5vcmRpYywuKicsICdebm92dGVjaCwuKicsICdebnV0c2JvYXJkLC4qJywgJ15udXZvdG9u
LC4qJywgJ15udmQsLionLCAnXm52aWRpYSwuKicsICdebnhwLC4qJywgJ15vY2VhbmljLC4q
JywgJ15va2F5YSwuKicsICdeb2tpLC4qJywgJ15vbGltZXgsLionLCAnXm9scGMsLionLCAn
Xm9uaW9uLC4qJywgJ15vbm5uLC4qJywgJ15vbnRhdCwuKicsICdeb3BhbGtlbGx5LC4qJywg
J15vcGVuY29yZXMsLionLCAnXm9wZW5yaXNjLC4qJywgJ15vcHRpb24sLionLCAnXm9yYW50
aCwuKicsICdeb3Jpc2V0ZWNoLC4qJywgJ15vcnR1c3RlY2gsLionLCAnXm9zZGRpc3BsYXlz
LC4qJywgJ15vdmVya2l6LC4qJywgJ15vdnRpLC4qJywgJ15veHNlbWksLionLCAnXm96em1h
a2VyLC4qJywgJ15wYW5hc29uaWMsLionLCAnXnBhcmFkZSwuKicsICdecGFyYWxsYXgsLion
LCAnXnBkYSwuKicsICdecGVyaWNvbSwuKicsICdecGVydmFzaXZlLC4qJywgJ15waGljb21t
LC4qJywgJ15waHl0ZWMsLionLCAnXnBpY29jaGlwLC4qJywgJ15waW5lNjQsLionLCAnXnBp
bmVyaXZlciwuKicsICdecGl4Y2lyLC4qJywgJ15wbGFudG93ZXIsLionLCAnXnBsYXRob21l
LC4qJywgJ15wbGRhLC4qJywgJ15wbHgsLionLCAnXnBuaSwuKicsICdecG9ja2V0Ym9vaywu
KicsICdecG9sYXJvaWQsLionLCAnXnBvcnR3ZWxsLC4qJywgJ15wb3NsYWIsLionLCAnXnBv
diwuKicsICdecG93ZXJ0aXAsLionLCAnXnBvd2VydnIsLionLCAnXnByaW11eCwuKicsICde
cHJvYm94MiwuKicsICdecHJ0LC4qJywgJ15wdWxzZWRsaWdodCwuKicsICdecHVyaXNtLC4q
JywgJ15xY2EsLionLCAnXnFjb20sLionLCAnXnFlbXUsLionLCAnXnFpLC4qJywgJ15xaWFv
ZGlhbiwuKicsICdecWlodWEsLionLCAnXnFuYXAsLionLCAnXnJhZHhhLC4qJywgJ15yYWlk
c29uaWMsLionLCAnXnJhbGluaywuKicsICdecmFtdHJvbiwuKicsICdecmFzcGJlcnJ5cGks
LionLCAnXnJheWRpdW0sLionLCAnXnJkYSwuKicsICdecmVhbHRlaywuKicsICdecmVuZXNh
cywuKicsICdecmVydmlzaW9uLC4qJywgJ15yZXgsLionLCAnXnJpY2h0ZWssLionLCAnXnJp
Y29oLC4qJywgJ15yaWtvbWFnaWMsLionLCAnXnJpb3QsLionLCAnXnJpc2N2LC4qJywgJ15y
b2NrY2hpcCwuKicsICdecm9ja3RlY2gsLionLCAnXnJvaG0sLionLCAnXnJvbmJvLC4qJywg
J15yb29mdWxsLC4qJywgJ15yb3NlYXBwbGVwaSwuKicsICdec2Ftc3VuZywuKicsICdec2Ft
dGVjLC4qJywgJ15zYW5jbG91ZCwuKicsICdec2FuZGlzaywuKicsICdec2F0b3osLionLCAn
XnNicywuKicsICdec2NoaW5kbGVyLC4qJywgJ15zZWFnYXRlLC4qJywgJ15zZWVlZCwuKics
ICdec2Vpcm9ib3RpY3MsLionLCAnXnNlbXRlY2gsLionLCAnXnNlbnNpcmlvbiwuKicsICde
c2Vuc29ydGVrLC4qJywgJ15zZmYsLionLCAnXnNnZCwuKicsICdec2dtaWNybywuKicsICde
c2d4LC4qJywgJ15zaGFycCwuKicsICdec2hpbWFmdWppLC4qJywgJ15zaGlyYXRlY2gsLion
LCAnXnNpLWVuLC4qJywgJ15zaS1saW51eCwuKicsICdec2lmaXZlLC4qJywgJ15zaWdtYSwu
KicsICdec2lpLC4qJywgJ15zaWwsLionLCAnXnNpbGFicywuKicsICdec2lsZWFkLC4qJywg
J15zaWxlcmd5LC4qJywgJ15zaWxleC1pbnNpZ2h0LC4qJywgJ15zaWxpY29ubWl0dXMsLion
LCAnXnNpbXRlaywuKicsICdec2lubGlueCwuKicsICdec2lub3ZvaXAsLionLCAnXnNpcGVl
ZCwuKicsICdec2lyZiwuKicsICdec2lzLC4qJywgJ15zaXRyb25peCwuKicsICdec2t5d29y
a3MsLionLCAnXnNtYXJ0bGFicywuKicsICdec21zYywuKicsICdec25wcywuKicsICdec29j
aGlwLC4qJywgJ15zb2Npb25leHQsLionLCAnXnNvbGlkcnVuLC4qJywgJ15zb2xvbW9uLC4q
JywgJ15zb255LC4qJywgJ15zcGFuc2lvbiwuKicsICdec3ByZCwuKicsICdec3N0LC4qJywg
J15zc3RhciwuKicsICdec3QsLionLCAnXnN0LWVyaWNzc29uLC4qJywgJ15zdGFycnksLion
LCAnXnN0YXJ0ZWssLionLCAnXnN0ZSwuKicsICdec3Rlcmljc3NvbiwuKicsICdec3VtbWl0
LC4qJywgJ15zdW5jaGlwLC4qJywgJ15zd2lyLC4qJywgJ15zeW5hLC4qJywgJ15zeW5vbG9n
eSwuKicsICdedGJzLC4qJywgJ150YnMtYmlvbWV0cmljcywuKicsICdedGNnLC4qJywgJ150
Y2wsLionLCAnXnRlY2huZXhpb24sLionLCAnXnRlY2hub2xvZ2ljLC4qJywgJ150ZWNoc3Rh
ciwuKicsICdedGVtcG8sLionLCAnXnRlcmFzaWMsLionLCAnXnRmYywuKicsICdedGhpbmUs
LionLCAnXnRoaW5neWpwLC4qJywgJ150aSwuKicsICdedGlhbm1hLC4qJywgJ150bG0sLion
LCAnXnRtdCwuKicsICdedG9wZWV0LC4qJywgJ150b3Bwb2x5LC4qJywgJ150b3B3aXNlLC4q
JywgJ150b3JhZGV4LC4qJywgJ150b3NoaWJhLC4qJywgJ150b3VtYXosLionLCAnXnRwaywu
KicsICdedHBsaW5rLC4qJywgJ150cG8sLionLCAnXnRxLC4qJywgJ150cm9uZnksLionLCAn
XnRyb25zbWFydCwuKicsICdedHJ1bHksLionLCAnXnRzZCwuKicsICdedHlhbiwuKicsICde
dS1ibG94LC4qJywgJ151LWJvb3QsLionLCAnXnVibnQsLionLCAnXnVjcm9ib3RpY3MsLion
LCAnXnVkb28sLionLCAnXnVnb29zLC4qJywgJ151bml3ZXN0LC4qJywgJ151cGlzZW1pLC4q
JywgJ151cnQsLionLCAnXnVzaSwuKicsICdedXRvbywuKicsICdedjMsLionLCAnXnZhaXNh
bGEsLionLCAnXnZhbXJzLC4qJywgJ152YXJpc2NpdGUsLionLCAnXnZpYSwuKicsICdedmlk
ZW9zdHJvbmcsLionLCAnXnZpcnRpbywuKicsICdedmlzaGF5LC4qJywgJ152aXNpb25veCwu
KicsICdedml0ZXNzZSwuKicsICdedml2YW50ZSwuKicsICdedm9jb3JlLC4qJywgJ152b2lw
YWMsLionLCAnXnZvdCwuKicsICdednh0LC4qJywgJ153YW5kLC4qJywgJ153YXZlc2hhcmUs
LionLCAnXndkLC4qJywgJ153ZSwuKicsICded2V0ZWssLionLCAnXndleGxlciwuKicsICde
d2h3YXZlLC4qJywgJ153aTJ3aSwuKicsICded2luYm9uZCwuKicsICded2luc3RhciwuKics
ICded2l0cywuKicsICded2xmLC4qJywgJ153bSwuKicsICded29ibywuKicsICdeeC1wb3dl
cnMsLionLCAnXnhlcywuKicsICdeeGlhb21pLC4qJywgJ154aWxseWJ1cywuKicsICdeeGlu
Z2JhbmdkYSwuKicsICdeeGlucGVuZywuKicsICdeeGlwaGVyYSwuKicsICdeeGxueCwuKics
ICdeeG5hbm8sLionLCAnXnh1bmxvbmcsLionLCAnXnh5bG9uLC4qJywgJ155bG0sLionLCAn
XnluYSwuKicsICdeeW9uZXMtdG9wdGVjaCwuKicsICdeeXNvZnQsLionLCAnXnphcmxpbmss
LionLCAnXnplYWx6LC4qJywgJ156ZWl0ZWMsLionLCAnXnppZG9vLC4qJywgJ156aWksLion
LCAnXnppbml0aXgsLionLCAnXnprbWFnaWMsLionLCAnXnp0ZSwuKicsICdeenl4ZWwsLion
DQo+IAlGcm9tIHNjaGVtYTogL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwN
Cj4gDQo+IA0KPiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNDE0
ODY1DQo+IA0KPiBUaGUgYmFzZSBmb3IgdGhlIHBhdGNoIGlzIGdlbmVyYWxseSB0aGUgbGFz
dCByYzEuIEFueSBkZXBlbmRlbmNpZXMNCj4gc2hvdWxkIGJlIG5vdGVkLg0KPiANCj4gSWYg
eW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2Vl
IHRoZSBhYm92ZQ0KPiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBp
bnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bw0KPiBkYXRlOg0KDQpUaGFua3MgdmVy
eSBtdWNoIGZvciB0aGUgcmVtaW5kZXIsIEkgaGF2ZSBmaXhlZCBpdCBhbmQgcmVzZW5kLg0K
DQo+IA0KPiBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2Ug
Y2hlY2sgYW5kIHJlLXN1Ym1pdC4NCj4gDQo+IC4NCj4gDQo=
