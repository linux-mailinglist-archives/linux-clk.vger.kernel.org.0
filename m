Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C68C06B19F9
	for <lists+linux-clk@lfdr.de>; Thu,  9 Mar 2023 04:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjCIDXr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Mar 2023 22:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjCIDXf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 22:23:35 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC86530C3;
        Wed,  8 Mar 2023 19:23:22 -0800 (PST)
X-UUID: bc58751cbe2911eda06fc9ecc4dadd91-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gupVP3qAEImhvmsEs2nAYMy7v36zx9V4+UytXHbkhNo=;
        b=Fdg2HSFt8rqscwHbS4TIb9bnoNy1r1mfan6DpsEqko0IMyoNVDJtEuNEcFOcYwbF+ieoeLBhVXrYa69vDHrm/tzUhEU2W/sZSj0A+jc6Od2T1KxwCaK/iloWwmEcmm3qkECRpeqqcb0r0Wjsp27OIqBu9KJz7YKRgGZ+FykZ8+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:1c88664d-7fe4-4c84-a4be-6529e919d3fa,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:4d9b39f5-ddba-41c3-91d9-10eeade8eac7,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: bc58751cbe2911eda06fc9ecc4dadd91-20230309
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <garmin.chang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1217588139; Thu, 09 Mar 2023 11:23:18 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 9 Mar 2023 11:23:16 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 9 Mar 2023 11:23:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcLu6EPRmKAVCcsfFk5qJC8h304dgXWg526ItXroBWBKpWt2Swnjh4wrat+3um5OJQ7+ipBFXF0UITXfnqtZsYCbBocImrfY7AhrrMz3SNXGkYd5WAUNvaTG9jD+Alp7dvF4d7NwhWooPJcjX4YNV3U3k8FuuyHTNzCQGWouhDgpq5BFNItzSpsshL/1ZEVs5fCy8HhaDbTLumZt0adQYIZ9Pluwk1CyqQwsmMsJuAJcD9jph2pHgtIWPRw9kEcajTM37ip7pIebP/WNaIV7WUkwg8e79SfXrMWq5ymS+mr39EgY67VQUAn5sV3vfGbp5DNnSspu34sjK9x83SJLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gupVP3qAEImhvmsEs2nAYMy7v36zx9V4+UytXHbkhNo=;
 b=HK7zTG9hh3wjuwop69+3ya5QH1uP/peHPiMd1ObQ7Lzd01QY4iScsGIwMj7Z8b0Cj8Hcne2dH4q/3stiQP92hrl3qkJT576lL4YFZQISaUfK5rDFusJgnG1qO7s4bsVrD3RdPfXH5tEKdyclvyLUs+VDzThwoR2+Yary0DayW+KR1U2eJPiE3ESENOdbbnEQ0OKi+Fe0TmXrvFQXxaDg6NybG+0SbWDo+QdnGd6zP9rzEtxkcQB4xwEddU0E475rjQ5MsGJ6guWbi+unQgC62wOMSHdhPJXBx3Hr1B1KfDL5y/qBots0GMAQrF3tVQFLlK2N48KgP7HeDIgklTDHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gupVP3qAEImhvmsEs2nAYMy7v36zx9V4+UytXHbkhNo=;
 b=rS4mVvoqnxQ1meJYS+Rd4tcaXdfAIW/+SyDUWwY3/iIUReZ+7MNLdjnuRWxO+6D28YB78UOmLm1lIpzrMB5mmu51L/fJMc9UzbI1tAh78f/fbjxWJ+Qoscs51QDREmVre/4HofEx85/A6/WWx9fKC2JnU7C/JHAtd77fanY1T14=
Received: from PUZPR03MB5877.apcprd03.prod.outlook.com (2603:1096:301:a5::6)
 by SI2PR03MB5546.apcprd03.prod.outlook.com (2603:1096:4:121::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 03:23:14 +0000
Received: from PUZPR03MB5877.apcprd03.prod.outlook.com
 ([fe80::cd32:5baf:ebd0:3eaa]) by PUZPR03MB5877.apcprd03.prod.outlook.com
 ([fe80::cd32:5baf:ebd0:3eaa%8]) with mapi id 15.20.6178.018; Thu, 9 Mar 2023
 03:23:14 +0000
From:   =?utf-8?B?R2FybWluIENoYW5nICjlvLXlrrbpipgp?= 
        <Garmin.Chang@mediatek.com>
To:     "wenst@chromium.org" <wenst@chromium.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH v5 15/19] clk: mediatek: Add MT8188 vppsys0 clock support
Thread-Topic: [PATCH v5 15/19] clk: mediatek: Add MT8188 vppsys0 clock support
Thread-Index: AQHZLAR5j7bISzpMD0STRPq7qTgYc66867MAgDUpOoA=
Date:   Thu, 9 Mar 2023 03:23:14 +0000
Message-ID: <dbdbe6142e25cac814bfb3727bd12d8d41fb918b.camel@mediatek.com>
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
         <20230119124848.26364-16-Garmin.Chang@mediatek.com>
         <CAGXv+5GxcgRd13Dd_29+y3cUWw--92Uut_1cN1D24E9OJTKF4A@mail.gmail.com>
In-Reply-To: <CAGXv+5GxcgRd13Dd_29+y3cUWw--92Uut_1cN1D24E9OJTKF4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB5877:EE_|SI2PR03MB5546:EE_
x-ms-office365-filtering-correlation-id: 0415c9f7-3ef9-4b4d-bc02-08db204d9e70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1CFAQzu/CK12lblYFYDhu8ugpFcUI1mE4BnwCxMFcZFn2TkfIlW/rOZk2smTMg+3eD72LsJtjifdS3BZYj/0IAskfXD9QAVtD58BcJs2xZY2sga/Mn93aU2KDgqO/sBMJtJgc8fCrwlTdYNtVzYH4T9Q1JAUnVDvEIg0njxX55AJInA9X1Wi+lawGfec0Lv1ShMcPvZxUnrLaNLfVkQaCVhJH+52fC7B4ipnLfYdAeOyn6Rl7v3khsTFLRbDGogHoePERr442eJp/eoQeh7oLajGQZTrW+BzK3TQbryfSDHc80UJEnwkNB3qpXioi/ztbWXGJcUaMQkUNf/JqiQ5sHg00yPZtEEnFf5ZSgU4Dri4pMu7xpW2+N5Dj65ZC/ZWqWdz1FwUAAxV/OZdPA2uD+MhoDRS2mjaArLUdx5sMEH0G35cluA/auJVg5GWY2v+YmKUCPMoRwcgKYVDERwjzWgFdG9zwNq4SoeMeAiZhSltX7GudsDFtdXipjOgHti/uvymNFzmISzp6YDOxUUNnSICtX/TNKBGKXbvvpYI2usKpkLlKL+Sz4pXVxMweKiorELtjK1bvFIbK9zjBE+t8e3ptMMJUm1yD3Qa/YpDgPLmhKgUqH+7Kn6XJeM9GKGlqj6KwLxxduqQFSrTDOcJ+EdsHrDLRGFpfGtjQqYBLrLTsiu1IBCZKwbGbJya8qwMbnuuiR+VuCD1shAqEXl2dA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB5877.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(85182001)(36756003)(54906003)(316002)(478600001)(6486002)(71200400001)(5660300002)(7416002)(8936002)(2906002)(66946007)(76116006)(66556008)(66446008)(64756008)(8676002)(6916009)(4326008)(66476007)(91956017)(41300700001)(122000001)(38070700005)(86362001)(38100700002)(186003)(2616005)(53546011)(26005)(6506007)(6512007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2YweWxoRmJONDl6ZjBnVmZmdGtrRW5vT1FrYzlXRUpFVk9oVUwyUTZwSGxR?=
 =?utf-8?B?clZ3N3A3dXZ4YTQ2TDU1dTRWNnBRS09hSmRhZ2x5K1YwdHdjcG5EekxmbU5s?=
 =?utf-8?B?dFVkQWQyUkdvK0RtOFM3aFZrN3pXZFlIS0x6NS9UYzdPN1pwMmhnRlRJTFd1?=
 =?utf-8?B?TkpreFYvcmhTZk51RmFRSVhKdGZEd0Fya0xRSm43bS9YQ2NBRzNtMkcrUzZO?=
 =?utf-8?B?WkZsNE9XNDlOVTZZYlViVXl5QVNXTExOMWxWOEJPUFI5RjJvemltZ0RaZXVM?=
 =?utf-8?B?VnBTdkN6SUNKRXlNejU1YW96Rk5ML2MvT1NJdFpwa3ZXRUxRQm81SUpRZXJm?=
 =?utf-8?B?b005UU9CNTg5RllXSEYzVTR4QXk4RU0zT0YwWk5kaURqa0FPaGN6eXJmS0tp?=
 =?utf-8?B?N2MycnhhbDljR09icXc0cnErZjYvY0VXQmc0ay9TRlNNWUJRTko1VjM1QmZh?=
 =?utf-8?B?cjdKMFQzOU5XVGhQVU4ySDMyalhSMm0rcmdManlYS0N5aE15QmNzdWJoMkhr?=
 =?utf-8?B?T3VjMzM3cnprVHlVdnNtcElDV3dyTTdlNTkxcVNrWlRSSHN5UmxEWXNLaTls?=
 =?utf-8?B?eUlrN2Q3RnNUVE5vMDc0VTdibnNBamd4L2hBb25abnViekdJZ3FRQzNNTkJU?=
 =?utf-8?B?ZlV1dnVNT1ZJbjVWRHl4REhMTnhTNHp6THNLVG1IaEtjOW1oMnhJaDJ6S2JU?=
 =?utf-8?B?L3BRV3c4a0pmSlhKQWUrSkJKQnZSczVGWWk1QmhXNVIveGlkblM3eC9sQWZC?=
 =?utf-8?B?emVCRWtQZW13bkpRbUtZMm9BNWlWcFJiZVVKY1hBd0oxZG5pU3lvdU94WmlK?=
 =?utf-8?B?QXpEajJOeEpSU0lLVG4wUjFqK0FBVWVnZlhtRWVnWTVBNmVPbndZMC91UVlW?=
 =?utf-8?B?UWl3aCtXa0V0WGl6TjlCN3FUYkxOOGEzZlJxRXZxRFg1WkRTaDFsS29JaVNW?=
 =?utf-8?B?c0pkQWsrQ3pQKzdNMTlmYVVqaDQwL0dQUkR1NDhwZytCS21YZTJWVllDT2lZ?=
 =?utf-8?B?bUNqRHFXK01NcHkvaUF5Z0IvUDVCZy96czJZZUpmbFQrVzMvWVg2M1Z6aUJ5?=
 =?utf-8?B?NnUxMUQzSDA3T2NLQTQ4Q2V0NzhhRldlVE9tOXova0ZtNDlaQ3ZvTDV0SVVL?=
 =?utf-8?B?aUM4R0xLU1RweVpVdUdLNE1MbUtCWVF5WTlPVkZMcGR4MnJWSlJKOHRpTm5C?=
 =?utf-8?B?UHpiUm9KQ2JCdUZwdU9vckhYVGpKM3phd2c0Y1FnelUxQ3Y2cVRpRUJNUXBp?=
 =?utf-8?B?WWRQSXZ2MXUraVpvR09RZVhvUjhSRUowYlo5RjFFVWp1R2VTL1I4R3dtb3hu?=
 =?utf-8?B?MDR0aHJWSjcxYWtWRWlBVElBNm5oYVdEVHljdmZCZ3dqUmFrWEVlQ1dwZHhp?=
 =?utf-8?B?eTZoaUdDd0FlYmhEZi9qdnp6cXZhUElWakZ5cC9jSnpPcGxzZTJXaW5FajQw?=
 =?utf-8?B?QnhHbVVEMXlsR1VkWjBRSisvM1NzY094M2tWUmpMYWplUGJHRm1aM294TEJa?=
 =?utf-8?B?dVo3VHE5U1hBTkdTc3dhUEhQU3p6Q2tTdkdsOXNUMC9qdHZoZ25EaUxsUWVO?=
 =?utf-8?B?T2orTVdIOU5QdWJxR3dtSHpvWDhBb0tleGx3RFdES3doUjhjYXB6amg3QzZj?=
 =?utf-8?B?TkJJUTRUZTE1L2Q5RjBBZ05paTJWdFFIVm43bjRacFZsY0IrZEJqZiszbHFn?=
 =?utf-8?B?alRjMjFXbnlKeUd4RGErRUFlRDhRZXU0eGx1RUhYbjEwMEx2eWJYQVQ3YUFw?=
 =?utf-8?B?NXpiVnVxdGZWK2NHOHlOeE5DakNRVmw4Sm9FY3NlcWRSdkQzRzFHL0w5WXlW?=
 =?utf-8?B?eU5yWFhJcytOdXdRRk5PTHVpOWFnY2c2UVc5Um9vTkphb3JxN21udE1TUXY3?=
 =?utf-8?B?dWdWKytlM1FDUFlWMGIxSmoveEd4SXFMNTJoT0Zjd25sRkM5MW5TZk13dXdn?=
 =?utf-8?B?SWNwNlRlb3JoeExocmVRUjYydWZCYlkyelZDSGFFdkhhdi9NRjNsRGJLT05D?=
 =?utf-8?B?NndyRnZraFdXSDE1cjlNLzRWVFhTcTk0RzM0T25DRFJwazNqbEExV3FRY3Ja?=
 =?utf-8?B?SWExNTM4MzNlSS9IWjRtcWpKbkx0NXQ5RW5zR2NYQ0dnRzRzejh1dnk2ODVh?=
 =?utf-8?B?NHR1cndPMXg3TGxIUk1Oa2pMc2NQRnFQVEwrRGRNVytuL2hoMVozRDdla0Rs?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0338F7FA6084F4DA57B9A33B3F1650F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB5877.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0415c9f7-3ef9-4b4d-bc02-08db204d9e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 03:23:14.5347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23tBusqziTz3LeGnQF0E7ZM3DZrDa8JRWhaHqzwiCMtv4J7jaLch5db7xOerq5037mSPJRWiFN+dut+iUti9SG5JA2vpvod8KkVyQWppBRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5546
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gRnJpLCAyMDIzLTAyLTAzIGF0IDE1OjMzICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IE9uIFRodSwgSmFuIDE5LCAyMDIzIGF0IDg6NTQgUE0gR2FybWluLkNoYW5nIDwNCj4gR2FybWlu
LkNoYW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gQWRkIE1UODE4OCB2cHBzeXMw
IGNsb2NrIGNvbnRyb2xsZXIgd2hpY2ggcHJvdmlkZXMgY2xvY2sgZ2F0ZQ0KPiA+IGNvbnRyb2xs
ZXIgZm9yIFZpZGVvIFByb2Nlc3NvciBQaXBlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEdh
cm1pbi5DaGFuZyA8R2FybWluLkNoYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgfCAgIDMgKy0NCj4gPiAgZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4OC12cHAwLmMgfCAxNDMNCj4gPiArKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVr
L2Nsay1tdDgxODgtdnBwMC5jDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21l
ZGlhdGVrL01ha2VmaWxlDQo+ID4gYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+
IGluZGV4IDIyYTM4NDAxNjBmYy4uNDhkZWVjYzZiNTIwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvY2xrL21lZGlhdGVrL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsv
TWFrZWZpbGUNCj4gPiBAQCAtODcsNyArODcsOCBAQCBvYmotJChDT05GSUdfQ09NTU9OX0NMS19N
VDgxODgpICs9IGNsay1tdDgxODgtDQo+ID4gYXBtaXhlZHN5cy5vIGNsay1tdDgxODgtdG9wY2tn
ZW4ubw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrLW10ODE4OC1w
ZXJpX2FvLm8gY2xrLW10ODE4OC0NCj4gPiBpbmZyYV9hby5vIFwNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNsay1tdDgxODgtY2FtLm8gY2xrLW10ODE4OC0NCj4gPiBj
Y3UubyBjbGstbXQ4MTg4LWltZy5vIFwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNsay1tdDgxODgtaXBlLm8gY2xrLW10ODE4OC0NCj4gPiBtZmcubyBjbGstbXQ4MTg4
LXZkZWMubyBcDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbGstbXQ4
MTg4LXZkbzAubyBjbGstbXQ4MTg4LQ0KPiA+IHZkbzEubyBjbGstbXQ4MTg4LXZlbmMubw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrLW10ODE4OC12ZG8wLm8gY2xr
LW10ODE4OC0NCj4gPiB2ZG8xLm8gY2xrLW10ODE4OC12ZW5jLm8gXA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY2xrLW10ODE4OC12cHAwLm8NCj4gPiAgb2JqLSQoQ09O
RklHX0NPTU1PTl9DTEtfTVQ4MTkyKSArPSBjbGstbXQ4MTkyLm8NCj4gPiAgb2JqLSQoQ09ORklH
X0NPTU1PTl9DTEtfTVQ4MTkyX0FVRFNZUykgKz0gY2xrLW10ODE5Mi1hdWQubw0KPiA+ICBvYmot
JChDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfQ0FNU1lTKSArPSBjbGstbXQ4MTkyLWNhbS5vDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxODgtdnBwMC5jDQo+
ID4gYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTg4LXZwcDAuYw0KPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5lN2I0NjE0MmQ2NTMNCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4OC12
cHAwLmMNCj4gPiBAQCAtMCwwICsxLDE0MyBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gKy8vDQo+ID4gKy8vIENvcHlyaWdodCAoYykgMjAyMiBN
ZWRpYVRlayBJbmMuDQo+ID4gKy8vIEF1dGhvcjogR2FybWluIENoYW5nIDxnYXJtaW4uY2hhbmdA
bWVkaWF0ZWsuY29tPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9jbG9jay9tZWRpYXRlayxtdDgxODgtY2xrLmg+DQo+ID4gKw0KPiA+ICsj
aW5jbHVkZSAiY2xrLWdhdGUuaCINCj4gPiArI2luY2x1ZGUgImNsay1tdGsuaCINCj4gPiArDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGVfcmVncyB2cHAwXzBfY2dfcmVncyA9IHsN
Cj4gPiArICAgICAgIC5zZXRfb2ZzID0gMHgyNCwNCj4gPiArICAgICAgIC5jbHJfb2ZzID0gMHgy
OCwNCj4gPiArICAgICAgIC5zdGFfb2ZzID0gMHgyMCwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGVfcmVncyB2cHAwXzFfY2dfcmVncyA9IHsNCj4gPiAr
ICAgICAgIC5zZXRfb2ZzID0gMHgzMCwNCj4gPiArICAgICAgIC5jbHJfb2ZzID0gMHgzNCwNCj4g
PiArICAgICAgIC5zdGFfb2ZzID0gMHgyYywNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2dhdGVfcmVncyB2cHAwXzJfY2dfcmVncyA9IHsNCj4gPiArICAgICAg
IC5zZXRfb2ZzID0gMHgzYywNCj4gPiArICAgICAgIC5jbHJfb2ZzID0gMHg0MCwNCj4gPiArICAg
ICAgIC5zdGFfb2ZzID0gMHgzOCwNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgR0FURV9W
UFAwXzAoX2lkLCBfbmFtZSwgX3BhcmVudCwNCj4gPiBfc2hpZnQpICAgICAgICAgICAgICAgICAg
ICAgICBcDQo+ID4gKyAgICAgICBHQVRFX01USyhfaWQsIF9uYW1lLCBfcGFyZW50LCAmdnBwMF8w
X2NnX3JlZ3MsIF9zaGlmdCwNCj4gPiAmbXRrX2Nsa19nYXRlX29wc19zZXRjbHIpDQo+ID4gKw0K
PiA+ICsjZGVmaW5lIEdBVEVfVlBQMF8xKF9pZCwgX25hbWUsIF9wYXJlbnQsDQo+ID4gX3NoaWZ0
KSAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAgICAgR0FURV9NVEsoX2lkLCBfbmFt
ZSwgX3BhcmVudCwgJnZwcDBfMV9jZ19yZWdzLCBfc2hpZnQsDQo+ID4gJm10a19jbGtfZ2F0ZV9v
cHNfc2V0Y2xyKQ0KPiA+ICsNCj4gPiArI2RlZmluZSBHQVRFX1ZQUDBfMihfaWQsIF9uYW1lLCBf
cGFyZW50LA0KPiA+IF9zaGlmdCkgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPiArICAgICAg
IEdBVEVfTVRLKF9pZCwgX25hbWUsIF9wYXJlbnQsICZ2cHAwXzJfY2dfcmVncywgX3NoaWZ0LA0K
PiA+ICZtdGtfY2xrX2dhdGVfb3BzX3NldGNscikNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2dhdGUgdnBwMF9jbGtzW10gPSB7DQo+ID4gKyAgICAgICAvKiBWUFAwXzAgKi8N
Cj4gPiArICAgICAgIEdBVEVfVlBQMF8wKENMS19WUFAwX01EUF9GRywgInZwcDBfbWRwX2ZnIiwg
InRvcF92cHAiLCAxKSwNCj4gPiArICAgICAgIEdBVEVfVlBQMF8wKENMS19WUFAwX1NUSVRDSCwg
InZwcDBfc3RpdGNoIiwgInRvcF92cHAiLCAyKSwNCj4gPiArICAgICAgIEdBVEVfVlBQMF8wKENM
S19WUFAwX1BBRERJTkcsICJ2cHAwX3BhZGRpbmciLCAidG9wX3ZwcCIsDQo+ID4gNyksDQo+ID4g
KyAgICAgICBHQVRFX1ZQUDBfMChDTEtfVlBQMF9NRFBfVENDLCAidnBwMF9tZHBfdGNjIiwgInRv
cF92cHAiLA0KPiA+IDgpLA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzAoQ0xLX1ZQUDBfV0FSUDBf
QVNZTkNfVFgsICJ2cHAwX3dhcnAwX2FzeW5jX3R4IiwNCj4gPiAidG9wX3ZwcCIsIDEwKSwNCj4g
PiArICAgICAgIEdBVEVfVlBQMF8wKENMS19WUFAwX1dBUlAxX0FTWU5DX1RYLCAidnBwMF93YXJw
MV9hc3luY190eCIsDQo+ID4gInRvcF92cHAiLCAxMSksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBf
MChDTEtfVlBQMF9NVVRFWCwgInZwcDBfbXV0ZXgiLCAidG9wX3ZwcCIsIDEzKSwNCj4gPiArICAg
ICAgIEdBVEVfVlBQMF8wKENMS19WUFAwMlZQUDFfUkVMQVksICJ2cHAwMnZwcDFfcmVsYXkiLA0K
PiA+ICJ0b3BfdnBwIiwgMTQpLA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzAoQ0xLX1ZQUDBfVlBQ
MTJWUFAwX0FTWU5DLA0KPiA+ICJ2cHAwX3ZwcDEydnBwMF9hc3luYyIsICJ0b3BfdnBwIiwgMTUp
LA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzAoQ0xLX1ZQUDBfTU1TWVNSQU1fVE9QLCAidnBwMF9t
bXN5c3JhbV90b3AiLA0KPiA+ICJ0b3BfdnBwIiwgMTYpLA0KPiA+ICsgICAgICAgR0FURV9WUFAw
XzAoQ0xLX1ZQUDBfTURQX0FBTCwgInZwcDBfbWRwX2FhbCIsICJ0b3BfdnBwIiwNCj4gPiAxNyks
DQo+ID4gKyAgICAgICBHQVRFX1ZQUDBfMChDTEtfVlBQMF9NRFBfUlNaLCAidnBwMF9tZHBfcnN6
IiwgInRvcF92cHAiLA0KPiA+IDE4KSwNCj4gPiArICAgICAgIC8qIFZQUDBfMSAqLw0KPiA+ICsg
ICAgICAgR0FURV9WUFAwXzEoQ0xLX1ZQUDBfU01JX0NPTU1PTl9NTVNSQU0sDQo+ID4gInZwcDBf
c21pX2NvbW1vbl9tbXNyYW0iLCAidG9wX3ZwcCIsIDApLA0KPiA+ICsgICAgICAgR0FURV9WUFAw
XzEoQ0xLX1ZQUDBfR0FMU19WRE8wX0xBUkIwX01NU1JBTSwNCj4gPiAidnBwMF9nYWxzX3ZkbzBf
bGFyYjBfbW1zcmFtIiwgInRvcF92cHAiLCAxKSwNCj4gPiArICAgICAgIEdBVEVfVlBQMF8xKENM
S19WUFAwX0dBTFNfVkRPMF9MQVJCMV9NTVNSQU0sDQo+ID4gInZwcDBfZ2Fsc192ZG8wX2xhcmIx
X21tc3JhbSIsICJ0b3BfdnBwIiwgMiksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBfMShDTEtfVlBQ
MF9HQUxTX1ZFTkNTWVNfTU1TUkFNLA0KPiA+ICJ2cHAwX2dhbHNfdmVuY3N5c19tbXNyYW0iLCAi
dG9wX3ZwcCIsIDMpLA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzEoQ0xLX1ZQUDBfR0FMU19WRU5D
U1lTX0NPUkUxX01NU1JBTSwNCj4gPiArICAgICAgICAgICAgICAgICAgICJ2cHAwX2dhbHNfdmVu
Y3N5c19jb3JlMV9tbXNyYW0iLCAidG9wX3ZwcCIsDQo+ID4gNCksDQo+ID4gKyAgICAgICBHQVRF
X1ZQUDBfMShDTEtfVlBQMF9HQUxTX0lORlJBX01NU1JBTSwNCj4gPiAidnBwMF9nYWxzX2luZnJh
X21tc3JhbSIsICJ0b3BfdnBwIiwgNSksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBfMShDTEtfVlBQ
MF9HQUxTX0NBTVNZU19NTVNSQU0sDQo+ID4gInZwcDBfZ2Fsc19jYW1zeXNfbW1zcmFtIiwgInRv
cF92cHAiLCA2KSwNCj4gPiArICAgICAgIEdBVEVfVlBQMF8xKENMS19WUFAwX0dBTFNfVlBQMV9M
QVJCNV9NTVNSQU0sDQo+ID4gInZwcDBfZ2Fsc192cHAxX2xhcmI1X21tc3JhbSIsICJ0b3BfdnBw
IiwgNyksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBfMShDTEtfVlBQMF9HQUxTX1ZQUDFfTEFSQjZf
TU1TUkFNLA0KPiA+ICJ2cHAwX2dhbHNfdnBwMV9sYXJiNl9tbXNyYW0iLCAidG9wX3ZwcCIsIDgp
LA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzEoQ0xLX1ZQUDBfU01JX1JFT1JERVJfTU1TUkFNLA0K
PiA+ICJ2cHAwX3NtaV9yZW9yZGVyX21tc3JhbSIsICJ0b3BfdnBwIiwgOSksDQo+ID4gKyAgICAg
ICBHQVRFX1ZQUDBfMShDTEtfVlBQMF9TTUlfSU9NTVUsICJ2cHAwX3NtaV9pb21tdSIsDQo+ID4g
InRvcF92cHAiLCAxMCksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBfMShDTEtfVlBQMF9HQUxTX0lN
R1NZU19DQU1TWVMsDQo+ID4gInZwcDBfZ2Fsc19pbWdzeXNfY2Ftc3lzIiwgInRvcF92cHAiLCAx
MSksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBfMShDTEtfVlBQMF9NRFBfUkRNQSwgInZwcDBfbWRw
X3JkbWEiLCAidG9wX3ZwcCIsDQo+ID4gMTIpLA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzEoQ0xL
X1ZQUDBfTURQX1dST1QsICJ2cHAwX21kcF93cm90IiwgInRvcF92cHAiLA0KPiA+IDEzKSwNCj4g
PiArICAgICAgIEdBVEVfVlBQMF8xKENMS19WUFAwX0dBTFNfRU1JMF9FTUkxLCAidnBwMF9nYWxz
X2VtaTBfZW1pMSIsDQo+ID4gInRvcF92cHAiLCAxNiksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBf
MShDTEtfVlBQMF9TTUlfU1VCX0NPTU1PTl9SRU9SREVSLA0KPiA+ICJ2cHAwX3NtaV9zdWJfY29t
bW9uX3Jlb3JkZXIiLCAidG9wX3ZwcCIsIDE3KSwNCj4gPiArICAgICAgIEdBVEVfVlBQMF8xKENM
S19WUFAwX1NNSV9SU0ksICJ2cHAwX3NtaV9yc2kiLCAidG9wX3ZwcCIsDQo+ID4gMTgpLA0KPiA+
ICsgICAgICAgR0FURV9WUFAwXzEoQ0xLX1ZQUDBfU01JX0NPTU1PTl9MQVJCNCwNCj4gPiAidnBw
MF9zbWlfY29tbW9uX2xhcmI0IiwgInRvcF92cHAiLCAxOSksDQo+ID4gKyAgICAgICBHQVRFX1ZQ
UDBfMShDTEtfVlBQMF9HQUxTX1ZERUNfVkRFQ19DT1JFMSwNCj4gPiAidnBwMF9nYWxzX3ZkZWNf
dmRlY19jb3JlMSIsICJ0b3BfdnBwIiwgMjApLA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzEoQ0xL
X1ZQUDBfR0FMU19WUFAxX1dQRVNZUywNCj4gPiAidnBwMF9nYWxzX3ZwcDFfd3Blc3lzIiwgInRv
cF92cHAiLCAyMSksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBfMShDTEtfVlBQMF9HQUxTX1ZETzBf
VkRPMV9WRU5DU1lTX0NPUkUxLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgInZwcDBfZ2Fsc192
ZG8wX3ZkbzFfdmVuY3N5c19jb3JlMSIsICJ0b3BfdnBwIiwNCj4gPiAyMiksDQo+ID4gKyAgICAg
ICBHQVRFX1ZQUDBfMShDTEtfVlBQMF9GQUtFX0VORywgInZwcDBfZmFrZV9lbmciLCAidG9wX3Zw
cCIsDQo+ID4gMjMpLA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzEoQ0xLX1ZQUDBfTURQX0hEUiwg
InZwcDBfbWRwX2hkciIsICJ0b3BfdnBwIiwNCj4gPiAyNCksDQo+ID4gKyAgICAgICBHQVRFX1ZQ
UDBfMShDTEtfVlBQMF9NRFBfVERTSFAsICJ2cHAwX21kcF90ZHNocCIsDQo+ID4gInRvcF92cHAi
LCAyNSksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBfMShDTEtfVlBQMF9NRFBfQ09MT1IsICJ2cHAw
X21kcF9jb2xvciIsDQo+ID4gInRvcF92cHAiLCAyNiksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBf
MShDTEtfVlBQMF9NRFBfT1ZMLCAidnBwMF9tZHBfb3ZsIiwgInRvcF92cHAiLA0KPiA+IDI3KSwN
Cj4gPiArICAgICAgIEdBVEVfVlBQMF8xKENMS19WUFAwX0RTSVBfUkRNQSwgInZwcDBfZHNpcF9y
ZG1hIiwNCj4gPiAidG9wX3ZwcCIsIDI4KSwNCj4gPiArICAgICAgIEdBVEVfVlBQMF8xKENMS19W
UFAwX0RJU1BfV0RNQSwgInZwcDBfZGlzcF93ZG1hIiwNCj4gPiAidG9wX3ZwcCIsIDI5KSwNCj4g
PiArICAgICAgIEdBVEVfVlBQMF8xKENMS19WUFAwX01EUF9ITVMsICJ2cHAwX21kcF9obXMiLCAi
dG9wX3ZwcCIsDQo+ID4gMzApLA0KPiA+ICsgICAgICAgLyogVlBQMF8yICovDQo+ID4gKyAgICAg
ICBHQVRFX1ZQUDBfMihDTEtfVlBQMF9XQVJQMF9SRUxBWSwgInZwcDBfd2FycDBfcmVsYXkiLA0K
PiA+ICJ0b3Bfd3BlX3ZwcCIsIDApLA0KPiA+ICsgICAgICAgR0FURV9WUFAwXzIoQ0xLX1ZQUDBf
V0FSUDBfQVNZTkMsICJ2cHAwX3dhcnAwX2FzeW5jIiwNCj4gPiAidG9wX3dwZV92cHAiLCAxKSwN
Cj4gPiArICAgICAgIEdBVEVfVlBQMF8yKENMS19WUFAwX1dBUlAxX1JFTEFZLCAidnBwMF93YXJw
MV9yZWxheSIsDQo+ID4gInRvcF93cGVfdnBwIiwgMiksDQo+ID4gKyAgICAgICBHQVRFX1ZQUDBf
MihDTEtfVlBQMF9XQVJQMV9BU1lOQywgInZwcDBfd2FycDFfYXN5bmMiLA0KPiA+ICJ0b3Bfd3Bl
X3ZwcCIsIDMpLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGludCBjbGtfbXQ4MTg4X3Zw
cDBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiArew0KPiA+ICsgICAg
ICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArICAgICAgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+cGFyZW50LT5vZl9ub2RlOw0KPiA+ICsgICAgICAgc3Ry
dWN0IGNsa19od19vbmVjZWxsX2RhdGEgKmNsa19kYXRhOw0KPiA+ICsgICAgICAgaW50IHI7DQo+
ID4gKw0KPiA+ICsgICAgICAgY2xrX2RhdGEgPSBtdGtfYWxsb2NfY2xrX2RhdGEoQ0xLX1ZQUDBf
TlJfQ0xLKTsNCj4gPiArICAgICAgIGlmICghY2xrX2RhdGEpDQo+ID4gKyAgICAgICAgICAgICAg
IHJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArICAgICAgIHIgPSBtdGtfY2xrX3JlZ2lzdGVy
X2dhdGVzKG5vZGUsIHZwcDBfY2xrcywNCj4gPiBBUlJBWV9TSVpFKHZwcDBfY2xrcyksIGNsa19k
YXRhKTsNCj4gDQo+IFRoaXMgQVBJIGhhcyBjaGFuZ2VkLiBQbGVhc2UgcmViYXNlIGFuZCB1cGRh
dGUuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9ucy4NCk9LIEkgd2lsbCBtb2RpZnkg
aXQgaW4gdjYuDQo+IA0KPiBPdGhlcndpc2UsDQo+IA0KPiBSZXZpZXdlZC1ieTogQ2hlbi1ZdSBU
c2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+DQo=
