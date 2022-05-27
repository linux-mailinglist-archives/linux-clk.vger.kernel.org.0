Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7595366FD
	for <lists+linux-clk@lfdr.de>; Fri, 27 May 2022 20:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349206AbiE0SlH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 May 2022 14:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244925AbiE0SlG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 May 2022 14:41:06 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF05E2781;
        Fri, 27 May 2022 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1653676862; x=1685212862;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=W7uMj6Jh5e8W6ifYX91FFMMVnKs1WFzBOWWTC/6nafc=;
  b=gTkzbpoRUfhtYHvy0c4SAx1AxFVEN29itMa/fAxCb9PIWaasPLNSu97X
   xKxFNg9MC8tlNsprAZCk8kTJvIBM5X3lcDHv+bAYfW2cWU9uUOGUY6fxG
   66QUAS8MpaMNQkPGtIX+XXkdF+OjRSKjwjVhR2SQ+hBgN3y+SggpSy1FD
   Xxzy6oWtpmjgl9s8c2zgsc2Oecpx3kKbmF0VkH26Wfq3IH3v/G/g1jjyC
   JaFL3ezDl9Su2eWsRMpQ/CasjFwzhITHi11lcZ4DWBgnRVBrhZ7rsz6gs
   Xkk7UqI84JpuI6K0/NSq133W8oa2HKbCHyMLgTzqzVkjDQ8hUYDABAcY4
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="97617229"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2022 11:41:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 27 May 2022 11:41:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 27 May 2022 11:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYoNvR2ZgWt/O16SGlNQ9dUjp5YsEE0WqRlhKD28QkJG8Ty26KOWtkeXC1iUFoeQoArF26rSyj8v6epVoVZuY6NbBUsxEqxc2TQt3MNH7zrEQmscNIzI0EDXYqebWzVl8UwlTU8tUyoPYPADdVCs0vTnJ22jR1Rn06ps+zkHKvXr0dLz5Srr+a+TGo6AarWoqat64gCxcyY5cSnLwKFrqyxCPaAmu5QORf4O81DDhwFdBpXEgtAaozE2KmVcFXRMEwx6MHDk5mNnsCF1EatRBf+lR4CCoFZ3FHrfl5iLT7h/c4hapw6fqQN1tdRiRbfy8x+dEe4t8cess04F9Kv8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7uMj6Jh5e8W6ifYX91FFMMVnKs1WFzBOWWTC/6nafc=;
 b=n/+PbTBYAQo9G4Uir36OWKSgrYz7XobLTVcBei94geYP3w+XRw8fvi1AceA3Gxavfk5n6APKtL7x4LBQgIMrrDcQ3wv5ubOQOO8FNxprLbxMgg+Qkxyn32RJb2cbqVFARoVvB+c0zFc3W3Wpb+m1BoudtoSlESuaIu/XM/CtFmDGfdf9jX47mttAEXDUKY4bhNEwxSoidkO/Q/9BsqI1L2TcGHHh5JsjZMQCy3Hp8caX65mPCuB70MfDoKkglvC+taeKQ1L3XBxl+979nSQNBDj5MnfwOIsX5cXyARAfUWy6OmekUsHLNOzuNf1fE3KCCJ3+Put1rNtkx1QWtAWDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7uMj6Jh5e8W6ifYX91FFMMVnKs1WFzBOWWTC/6nafc=;
 b=rUxn8KqIhFZeutmeYAlUZg40XyqeeDnnjasWYqidX3/+w1+J+/qe1qGg/iDuqVbnQgP6t5PK5yXG+WTfuYyMlJ3BJlnGuoyZSS3lbq9Kw921XPFpdhItfoIZgdszH5kUTPlt8tbZchV/fmizUzqBOxoE0lFNcssyDnlydGsZGuk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB6213.namprd11.prod.outlook.com (2603:10b6:8:ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 18:40:59 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%6]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 18:40:59 +0000
From:   <Conor.Dooley@microchip.com>
To:     <sboyd@kernel.org>
CC:     <Daire.McNamara@microchip.com>, <geert@linux-m68k.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mturquette@baylibre.com>, <p.zabel@pengutronix.de>
Subject: Reset controller within a clock driver
Thread-Topic: Reset controller within a clock driver
Thread-Index: AQHYcflPoksJXIVaQkOgoJTQWMRNig==
Date:   Fri, 27 May 2022 18:40:59 +0000
Message-ID: <31b7293f-662d-4a94-1717-9c76d7f33840@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b160437-77ce-4e02-6db5-08da40107186
x-ms-traffictypediagnostic: DM4PR11MB6213:EE_
x-microsoft-antispam-prvs: <DM4PR11MB6213E0E937EC733F2214045698D89@DM4PR11MB6213.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LCXhkzW+MUuzU2Nq5AXvL2I20rTtTe35UnnOrWfVqTY6M8W7PPChV8VDkznC6teVD0bMV5ZlS4kTfqETDr4l/0gL2cYCMEg1Hq00yMuwr4tAAbfZh+tF+VVaO8rhZc9Gnlu2iFFBqDqiP4GlCANT7Z3pK38c80OgOBiVmRx7YVJ+KFgrxC2oNFcFja+bfhef2X+3uuciOPk9Txu9+s+OjH3TIHj+ufVim6gLuGLdBhRikcn/3iroH17Z8gyXK3k3EWnYinYp06D8gagbfPk9h45mkiVtWNsjujCUz+FkIa6lczOPN6lN1Nmmzk4BMnKbkvKSs1IsTCc9rVcAWjVzG72Wyi8GFHBz1WUYfD3cCj4tKJEGwZKZ7Q/7hrQlD9H8fme4jtxTFvAFcSoR4I2Khu8YPTcEmcrRKsMnOkBLCmfPGLrQPr8LSGLyRxl5DHwigQ7DAeDaFx1jlcnLGaRaY0AzpwiIpzQaTZbvQgVBvlxjKj8zVqc+GY0FE8Ys7Y9PzH6pOEoNILHHL5lBbh7VT5o+EC7o3iMpC6NNu5NN9TtRn/9CQHCO0P379tA0IFBo3b8B+755uqtUy0ngPTM5kVB/jXR4af6Y66pHvAWQTVfDUkUxRdjxSfdHqvIoOnR/VKl4KMBfpDWt/c0LY9/Pt7QI3kcYY5uvsXxS4H+ntF+QtZJ6gvd19TSI5z8PzNvrcVEhryrizj2NeVcdimONHHholb5NBWMkvVSCDjVr24g6U+8XPM3uT9hLB2nU8l+bSVCQSYyo1cgh0I8Oq7+kDaXFk7WjPi4pov1ObeG/M/ZCeCMnb/2VZecOuolIjGarN4b/GETAz0IYrsA0hD9j7m41C7pAwTzCuopjKZhWmIuF6RyZ6VgjgyIe4/5Uf9vA6BxpJFGHNJzPp4wX7jxOyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(76116006)(64756008)(54906003)(38070700005)(6916009)(2906002)(66556008)(66446008)(8676002)(186003)(31696002)(316002)(66476007)(71200400001)(83380400001)(36756003)(5660300002)(31686004)(86362001)(66946007)(2616005)(6486002)(6506007)(26005)(6512007)(91956017)(966005)(38100700002)(4326008)(122000001)(508600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjUycCs2eVN6MzhDU1BhcWJTYURKck1TdWF0RGp6VDl3b2pEdDUxT2VlL0FK?=
 =?utf-8?B?dENtemE4NlpoM1A4ejRQUmZFS0g5V3BWRUlSL3lTTWRLb0tnMFZ2TndiekJQ?=
 =?utf-8?B?QWtiY3dGTXA4djlDOW1QdFk5WHpLUnQ5WlVsUGVnb3VsRWdLaHhtYzBXT2to?=
 =?utf-8?B?VktGb2M5YnBobTJjb1dBZ1BHNWZsVzUvOHpqeDJZUWtzU1JDd3BXYXBNL2Mv?=
 =?utf-8?B?NkNVcE1USUNvbkVYeWx3Q0FrNW1GV1BlRXVlNUpWOVZjeHEraXdPbVZ0eWVS?=
 =?utf-8?B?SU5VU3Y5M3ZEeEduUXE3SDVpME1DSy9WRW04ak5WQWxOdDl4Qk1zMkpSZ0ZQ?=
 =?utf-8?B?aTBkcUJ6UG9DVzZHTFR2T0dzMkdIbHhaK2dKWEZHQVlpejZuczlDMzUxZith?=
 =?utf-8?B?cnd3NzZJV0ErY2Fwcjl1SmQ0V00vYVk5MEVmNjRvYmI2cWpPb1hGUDVyZkxi?=
 =?utf-8?B?YmowM3B2QzhpYUlnZWFYTW85QTdvRXNzM1hFL1hSK1pEVlg1Qy9TdS8waHl4?=
 =?utf-8?B?L2FGREpocVRoTUJQYjQ3YTIyL2E4eW9TVzIxTjNVS1JEa1pySGFYdGo5eXhV?=
 =?utf-8?B?cGU4dWV2RmlOVTFDamd3eVlJcXJjRi83SUI2alJ0QnRZdTdOM2JReERkN2tL?=
 =?utf-8?B?T1FSUENoS0xPb3pNSS9sYmRRK2x2amJ1Z0Rnbjd5bDBpK1FuOXZLZCtDY0sz?=
 =?utf-8?B?KzIybHp3OUV2TFQzN2pzU0swR1NMZ25uTzhSL0pPcVRCRkdlMGloSm41ZExB?=
 =?utf-8?B?clhBQ1BFTUxHY0ZCRjRhMlNrNDJzK3BWamFFUXlramt1UURaZ3p2cmF2UTN2?=
 =?utf-8?B?TVV2QWtoeGR4REsrOXRVMFhlRG4rWjkyNXBrRmlGVGErK3loZEU1d3NBRlJB?=
 =?utf-8?B?RjJKdXVRSDFhYzBUYTlpTFRXVFFJQnJYa0xyU3UvRXRmNHg3SjBFTkNLeFo2?=
 =?utf-8?B?US9tbVRod21naEFBQSs1N1NZalBnRS9Pa3Rsdzh6Y3AvamVuWWZtUTJkMy9E?=
 =?utf-8?B?alg3Q3ppdlpIdi9vbVBrajZGZUdSdHJhNVJROStoZk1oRUt4KytyZkdUWWhq?=
 =?utf-8?B?YTN3SmRpU2FhNi8xS3JhaU5MS25FK3RnQzdFS0piVDRiK1lQR0k2K1dEVmJ0?=
 =?utf-8?B?bWlRNmU0TjVsYUVCZ3REZzVzSEpSSllkUGcxUXNEcFA1QVdoV1YwZEJJRWtV?=
 =?utf-8?B?ZmVhbENJalUzWHFKa29LL3dSa1JBalFhVzBkRWQ1SzBuQUluTlNYa3NRYVRu?=
 =?utf-8?B?THdXdEF4TlNwRllybkV5RnZIaXcxbEZEVTNUbmkwZW5zVmxWS3dpTlM0Wkw4?=
 =?utf-8?B?bnFEUWZKUUg3SzZvendSbTZVUktCWVNpMW5ZeWhaWnpneVhrSGIrbzZNaWhH?=
 =?utf-8?B?bmhSUFFFdWQvamxsNU1ZVWxiVzZaTlJkdjRKOG12dVk3T095dnI3K2tqekZy?=
 =?utf-8?B?Nk1MdnphdEpaZHhiMHZWbThMVEphanlhZHhXSDJxM255QkZvNGJlY2NYMUhw?=
 =?utf-8?B?TklCcG9yTWYrTlZGbW42Uzl0enB4N2ZSRTlaTlhjOEJYdHBzRVNLVUorMlNh?=
 =?utf-8?B?N0pMZklRSnBhUDVJYnJTODBRN3RLYXZmdDdLMFdmQjE2TkRPaUVvTDJDRmRl?=
 =?utf-8?B?b0JvVk5wUjZoUnpMVkduRC85MmxMRDNxLzFVN1NKT1Z2dWNOck1WRTYybmU0?=
 =?utf-8?B?WDF4ZElvelRUYytmMkJCTGhCcUZoaVZ4YldxdTV6UzJjRG90a2ZSVUtqNElQ?=
 =?utf-8?B?R0dicG8xWDZmMFRxZ3NKUHBVcXI5R2doYlFwVFJSQ3dudklaV1dJOHRrM01D?=
 =?utf-8?B?dXZmWG4waU1vTW5UeVdPOU8rUGF3ZjZWWU1kQ25nQ0RBbnNPTmZrdVh1bUxR?=
 =?utf-8?B?Nmg5ejhYUWc5SEJsQ1JibGdOcUpDU2dpZ2VLYTcxSzBnS1hRVkplMHE5b2Ns?=
 =?utf-8?B?cWVDMTZaeXNrakc1VW5ZejJOMUpNYnVsZFp6L0RKUzdWaDBCS1ZZUVFHbjBp?=
 =?utf-8?B?aGRvcE9lbUJaT1RxbTh2YTA0Y2Y5NDFlWEtKOVdjMExtenliY3ZkcWt5a0Rn?=
 =?utf-8?B?WlF5a1g5RG9NVTBSQTJLMCtLK1N6M0E5T3lhUlJYTUM4U25ZQ1g5YTlPUVBJ?=
 =?utf-8?B?ZStma0tlYmxIb1JuWHBLZjJjOVRQZ1ZHajBlMk9FV1p3MFBKRHIrQ2YxS0Vt?=
 =?utf-8?B?Q0hTUkFSaE0wUzlwNmVpazRqMjJBTG1TVTVtSlNrdE1hbDY3dEhkVlI0Ri9R?=
 =?utf-8?B?d2RVZFpnODVMMEhIS0lndjl5Y3hSV2xKR3FwRzJGblVUZk9ieTJXajRJYVJH?=
 =?utf-8?B?RThSaW05bVp4ZUkrSmhtUmVKdWE1RGw1NWhuTURiTzZMOU1NK3laUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5ABD47D1F576945A484A5EE7747BD34@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b160437-77ce-4e02-6db5-08da40107186
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 18:40:59.4323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUKzlLyytZ5q8MilJ3rDTFlVEUyPjIzSysW6n62qGoLh+RnTaGZUmlVszkf2NGhkyuFY4e71NGGCKicxXHadpi5Som9/CbfkmT7tf7O6VAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6213
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KQWZ0ZXIgSSBzZW50IHRoZSBmaXggZm9yIHRoZSBicm9rZW4gcmVzZXRz
IGluIGNsay9taWNyb2NoaXAvY2xrLW1wZnMuYywNClswXSBJIHN0YXJ0ZWQgbG9va2luZyBhdCBt
YWtpbmcgYSBwcm9wZXIgcmVzZXQgY29udHJvbGxlciBkcml2ZXIgYSBsYQ0KY2xrL3JlbmVzYXMv
e3JlbmVzYXMtY3BnLW1zc3IscnpnbDJsLWNwZ30uYyB3aGVyZSB0aGUgcmVzZXQgY29udHJvbGxl
cg0KaXMgcGFydCBvZiB0aGUgY2xvY2sgZHJpdmVyIGZpbGUuDQoNCkkgZGlkIGl0IHRoYXQgd2F5
IGIvYyB0aGUgcmVzZXQgY29udHJvbGxlciBpcyBqdXN0IGEgc2luZ2xlIHJlZywNCnN1cnJvdW5k
ZWQgYnkgcmVnaXN0ZXJzIHVzZWQgYnkgY2xvY2tzLiBJdCdzIHJvdWdobHkgYSArMTMwLC0xMCBs
aW5lDQpjaGFuZ2UgdG8gdGhlIGV4aXN0aW5nIGRyaXZlci4gQSAvdmVyeS8gcm91Z2ggdmVyc2lv
biB0aGF0IHdpbGwgbm90DQphcHBseSB3aXRob3V0IG90aGVyIGNsZWFudXAgaXMgYXBwZW5kZWQg
Zm9yIGNvbnRleHQuDQoNCkJlZm9yZSBJIGdvdCBhcm91bmQgdG8gdGVzdGluZyBwcm9wZXJseSBh
bmQgY2xlYW5pbmcgaXQgdXAgZm9yDQpzdWJtaXNzaW9uLCBJIHNhdyBhIG1haWwgeW91IGhhZCBz
ZW50IGFuZCB3b25kZXJlZCBpZiBJJ2QgZ29uZSBmb3IgdGhlDQp3cm9uZyBhcHByb2FjaCBbMV0u
DQoNClNob3VsZCBJIGluc3RlYWQgaGF2ZSBteSBjbG9jayBkcml2ZXIgY3JlYXRlIGEgZGV2aWNl
IGZvciB0aGUgcmVzZXQNCmNvbnRyb2xsZXIgdG8gYmluZCB0bywgb3IgaXMgdGhhdCBvdmVya2ls
bCBmb3IgYSBzaW5nbGUgcmVnaXN0ZXIgJg0KU2VyZ2UncyBzaXR1YXRpb24gaXMgZGlmZmVyZW50
IGIvYyBoZSdkIGNyZWF0ZWQgYSBmaWxlIHB1cmVseSBmb3INCmEgcmVzZXQgY29udHJvbGxlcj8N
Cg0KVGhhbmtzLA0KQ29ub3IuDQoNCjAgLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1j
bGsvMjAyMjA0MTEwNzIzNDAuNzQwOTgxLTEtY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20vDQox
IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2xrLzIwMjIwNTE3MDczNzI5LjJGQUUy
QzM4NUI4QHNtdHAua2VybmVsLm9yZy8NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21pY3Jv
Y2hpcC9jbGstbXBmcy5jIGIvZHJpdmVycy9jbGsvbWljcm9jaGlwL2Nsay1tcGZzLmMNCmluZGV4
IGNlM2E0ODQ3MmZiYS4uZDlkMWE0ZDlmMTMxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9jbGsvbWlj
cm9jaGlwL2Nsay1tcGZzLmMNCisrKyBiL2RyaXZlcnMvY2xrL21pY3JvY2hpcC9jbGstbXBmcy5j
DQpAQCAtOSw2ICs5LDcgQEANCiAjaW5jbHVkZSA8bGludXgvaW8uaD4NCiAjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+DQogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KKyNpbmNs
dWRlIDxsaW51eC9yZXNldC1jb250cm9sbGVyLmg+DQogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4N
CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbWljcm9jaGlwLG1wZnMtY2xvY2suaD4NCiAN
CkBAIC0yOSw3ICszMCwxMyBAQA0KICNkZWZpbmUgTVNTUExMX1BPU1RESVZfV0lEVEggICAweDA3
dQ0KICNkZWZpbmUgTVNTUExMX0ZJWEVEX0RJViAgICAgICA0dQ0KIA0KKyNkZWZpbmUgTVBGU19Q
RVJJUEhfT0ZGU0VUICAgICAzdQ0KKw0KIHN0cnVjdCBtcGZzX2Nsb2NrX2RhdGEgew0KKyAgICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXY7DQorI2lmZGVmIENPTkZJR19SRVNFVF9DT05UUk9MTEVSDQor
ICAgICAgIHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiByY2RldjsNCisjZW5kaWYNCiAgICAg
ICAgdm9pZCBfX2lvbWVtICpiYXNlOw0KICAgICAgICB2b2lkIF9faW9tZW0gKm1zc3BsbF9iYXNl
Ow0KICAgICAgICBzdHJ1Y3QgY2xrX2h3X29uZWNlbGxfZGF0YSBod19kYXRhOw0KQEAgLTM0NCwx
MCArMzUxLDYgQEAgc3RhdGljIGludCBtcGZzX3BlcmlwaF9jbGtfZW5hYmxlKHN0cnVjdCBjbGtf
aHcgKmh3KQ0KIA0KICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmbXBmc19jbGtfbG9jaywgZmxh
Z3MpOw0KIA0KLSAgICAgICByZWcgPSByZWFkbF9yZWxheGVkKGJhc2VfYWRkciArIFJFR19TVUJC
TEtfUkVTRVRfQ1IpOw0KLSAgICAgICB2YWwgPSByZWcgJiB+KDF1IDw8IHBlcmlwaC0+c2hpZnQp
Ow0KLSAgICAgICB3cml0ZWxfcmVsYXhlZCh2YWwsIGJhc2VfYWRkciArIFJFR19TVUJCTEtfUkVT
RVRfQ1IpOw0KLQ0KICAgICAgICByZWcgPSByZWFkbF9yZWxheGVkKGJhc2VfYWRkciArIFJFR19T
VUJCTEtfQ0xPQ0tfQ1IpOw0KICAgICAgICB2YWwgPSByZWcgfCAoMXUgPDwgcGVyaXBoLT5zaGlm
dCk7DQogICAgICAgIHdyaXRlbF9yZWxheGVkKHZhbCwgYmFzZV9hZGRyICsgUkVHX1NVQkJMS19D
TE9DS19DUik7DQpAQCAtMzgxLDEyICszODQsOSBAQCBzdGF0aWMgaW50IG1wZnNfcGVyaXBoX2Ns
a19pc19lbmFibGVkKHN0cnVjdCBjbGtfaHcgKmh3KQ0KICAgICAgICB2b2lkIF9faW9tZW0gKmJh
c2VfYWRkciA9IHBlcmlwaF9ody0+YmFzZTsNCiAgICAgICAgdTMyIHJlZzsNCiANCi0gICAgICAg
cmVnID0gcmVhZGxfcmVsYXhlZChiYXNlX2FkZHIgKyBSRUdfU1VCQkxLX1JFU0VUX0NSKTsNCi0g
ICAgICAgaWYgKChyZWcgJiAoMXUgPDwgcGVyaXBoLT5zaGlmdCkpID09IDB1KSB7DQotICAgICAg
ICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChiYXNlX2FkZHIgKyBSRUdfU1VCQkxLX0NMT0NL
X0NSKTsNCi0gICAgICAgICAgICAgICBpZiAocmVnICYgKDF1IDw8IHBlcmlwaC0+c2hpZnQpKQ0K
LSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7DQotICAgICAgIH0NCisgICAgICAgcmVn
ID0gcmVhZGxfcmVsYXhlZChiYXNlX2FkZHIgKyBSRUdfU1VCQkxLX0NMT0NLX0NSKTsNCisgICAg
ICAgaWYgKHJlZyAmICgxdSA8PCBwZXJpcGgtPnNoaWZ0KSkNCisgICAgICAgICAgICAgICByZXR1
cm4gMTsNCiANCiAgICAgICAgcmV0dXJuIDA7DQogfQ0KQEAgLTQ3Miw2ICs0NzIsMTE4IEBAIHN0
YXRpYyBpbnQgbXBmc19jbGtfcmVnaXN0ZXJfcGVyaXBocyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBtcGZzX3BlcmlwaF9od19jDQogICAgICAgIHJldHVybiAwOw0KIH0NCiANCisvKg0KKyAq
IFBlcmlwaGVyYWwgY2xvY2sgcmVzZXRzDQorICoNCisgKiBDTEtfUkVTRVJWRUQgZG9lcyBub3Qg
bWFwIHRvIGEgY2xvY2ssIGJ1dCBpdCBkb2VzIG1hcCB0byBhIHJlc2V0IGxpbmUsIHNvIGl0DQor
ICogaGFzIHRvIGJlIGFjY291bnRlZCBmb3IgaGVyZS4NCisgKg0KKyAqLw0KKw0KKyNpZmRlZiBD
T05GSUdfUkVTRVRfQ09OVFJPTExFUg0KKw0KKyNkZWZpbmUgcmNkZXZfdG9fY2xvY2tfZGF0YSh4
KSBjb250YWluZXJfb2YoKHgpLCBzdHJ1Y3QgbXBmc19jbG9ja19kYXRhLCByY2RldikNCisNCisv
LyBzdGF0aWMgaW50IG1wZnNfcmVzZXQoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2Rl
diwgdW5zaWduZWQgbG9uZyBpZCkNCisvLyB7IA0KKy8vICAgICBzdHJ1Y3QgbXBmc19jbG9ja19k
YXRhICpjbGtfZGF0YSA9IHJjZGV2X3RvX2Nsb2NrX2RhdGEocmNkZXYpOw0KKy8vDQorLy8NCisv
Lw0KKy8vDQorLy8NCisvLw0KKy8vDQorLy8NCisvLw0KKy8vDQorLy8NCisvLw0KKy8vDQorLy8N
CisvLw0KKy8vICAgICByZXR1cm4gMDsNCisvLyB9DQorDQorc3RhdGljIGludCBtcGZzX2Fzc2Vy
dChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LCB1bnNpZ25lZCBsb25nIGlkKQ0K
K3sNCisgICAgICAgc3RydWN0IG1wZnNfY2xvY2tfZGF0YSAqY2xrX2RhdGEgPSByY2Rldl90b19j
bG9ja19kYXRhKHJjZGV2KTsNCisgICAgICAgdTMyIHJlZywgdmFsOw0KKw0KKyAgICAgICByZWcg
PSByZWFkbF9yZWxheGVkKGNsa19kYXRhLT5iYXNlICsgUkVHX1NVQkJMS19SRVNFVF9DUik7DQor
ICAgICAgIHZhbCA9IHJlZyB8ICgxdSA8PCBpZCk7DQorICAgICAgIHdyaXRlbF9yZWxheGVkKHZh
bCwgY2xrX2RhdGEtPmJhc2UgKyBSRUdfU1VCQkxLX1JFU0VUX0NSKTsNCisNCisgICAgICAgZGV2
X2RiZyhjbGtfZGF0YS0+ZGV2LCAiZGVhc3NlcnQgcmVzZXQ6ICUwMmx1XG4iLCBpZCk7DQorICAg
ICAgIHJldHVybiAwOw0KK30NCisNCitzdGF0aWMgaW50IG1wZnNfZGVhc3NlcnQoc3RydWN0IHJl
c2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwgdW5zaWduZWQgbG9uZyBpZCkNCit7DQorICAgICAg
IHN0cnVjdCBtcGZzX2Nsb2NrX2RhdGEgKmNsa19kYXRhID0gcmNkZXZfdG9fY2xvY2tfZGF0YShy
Y2Rldik7DQorICAgICAgIHUzMiByZWcsIHZhbDsNCisNCisgICAgICAgcmVnID0gcmVhZGxfcmVs
YXhlZChjbGtfZGF0YS0+YmFzZSArIFJFR19TVUJCTEtfUkVTRVRfQ1IpOw0KKyAgICAgICB2YWwg
PSByZWcgJiB+KDF1IDw8IGlkKTsNCisgICAgICAgd3JpdGVsX3JlbGF4ZWQodmFsLCBjbGtfZGF0
YS0+YmFzZSArIFJFR19TVUJCTEtfUkVTRVRfQ1IpOw0KKw0KKyAgICAgICBkZXZfZGJnKGNsa19k
YXRhLT5kZXYsICJkZWFzc2VydCByZXNldDogJTAybHVcbiIsIGlkKTsNCisNCisgICAgICAgcmV0
dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBpbnQgbXBmc19zdGF0dXMoc3RydWN0IHJlc2V0X2NvbnRy
b2xsZXJfZGV2ICpyY2RldiwgdW5zaWduZWQgbG9uZyBpZCkNCit7DQorICAgICAgIHN0cnVjdCBt
cGZzX2Nsb2NrX2RhdGEgKmNsa19kYXRhID0gcmNkZXZfdG9fY2xvY2tfZGF0YShyY2Rldik7DQor
ICAgICAgIHUzMiByZWc7DQorDQorICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQoY2xrX2RhdGEt
PmJhc2UgKyBSRUdfU1VCQkxLX1JFU0VUX0NSKTsNCisgICAgICAgcmV0dXJuIChyZWcgJiAoMXUg
PDwgaWQpKTsNCit9DQorDQorICAgICAgIC8vIC5yZXNldCA9IG1wZnNfcmVzZXQsDQorc3RhdGlj
IGNvbnN0IHN0cnVjdCByZXNldF9jb250cm9sX29wcyBtcGZzX3Jlc2V0X29wcyA9IHsNCisgICAg
ICAgLmFzc2VydCA9IG1wZnNfYXNzZXJ0LA0KKyAgICAgICAuZGVhc3NlcnQgPSBtcGZzX2RlYXNz
ZXJ0LA0KKyAgICAgICAuc3RhdHVzID0gbXBmc19zdGF0dXMsDQorfTsNCisNCisvL2dlZXJ0IC0g
ZG9lcyBpdCBtYWtlIHNlbnNlIHRvIHJldXNlIHRoZSBjbGtfIGluZGV4ZXMgZm9yIHRoZSByZXNl
dCBjdHJscj8NCisvLyAtPiB0aGV5IHJ1biBmcm9tIDMgdG8gMzIgYnV0IHNraXAgb25lDQorLy9p
ZiB5ZXMsIGRvIGkgcCBtdWNoIGp1c3Qgc3VidHJhY3QgMyBpbiBvZl94bGF0ZSAmIG1hbmlwdWxh
dGUgdGhhdCBiaXQ/DQorc3RhdGljIGludCBtcGZzX3Jlc2V0X3hsYXRlKHN0cnVjdCByZXNldF9j
b250cm9sbGVyX2RldiAqcmNkZXYsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IG9mX3BoYW5kbGVfYXJncyAqcmVzZXRfc3BlYykNCit7DQorICAgICAgIHN0cnVjdCBt
cGZzX2Nsb2NrX2RhdGEgKmNsa19kYXRhID0gcmNkZXZfdG9fY2xvY2tfZGF0YShyY2Rldik7DQor
ICAgICAgIHVuc2lnbmVkIGludCBpbmRleCA9IHJlc2V0X3NwZWMtPmFyZ3NbMF07DQorICAgICAg
IC8qIGFjY291bnQgZm9yIHJlc2VydmVkIGZwZ2EgZmFicmljIHJlc2V0ICovDQorICAgICAgIHVu
c2lnbmVkIGludCBudW1fcmVzZXRzID0gQVJSQVlfU0laRShtcGZzX3BlcmlwaF9jbGtzKSArIDE7
DQorDQorICAgICAgIGlmIChpbmRleCA8IE1QRlNfUEVSSVBIX09GRlNFVCB8fCBpbmRleCA+IChN
UEZTX1BFUklQSF9PRkZTRVQgKyBudW1fcmVzZXRzKSkgew0KKyAgICAgICAgICAgICAgIGRldl9l
cnIoY2xrX2RhdGEtPmRldiwgIkludmFsaWQgcmVzZXQgaW5kZXggJXVcbiIsIHJlc2V0X3NwZWMt
PmFyZ3NbMF0pOw0KKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KKyAgICAgICB9DQor
DQorICAgICAgIHJldHVybiBpbmRleCAtIE1QRlNfUEVSSVBIX09GRlNFVDsNCit9DQorc3RhdGlj
IGludCBtcGZzX3Jlc2V0X2NvbnRyb2xsZXJfcmVnaXN0ZXIoc3RydWN0IG1wZnNfY2xvY2tfZGF0
YSAqY2xrX2RhdGEpDQorew0KKyAgICAgICBjbGtfZGF0YS0+cmNkZXYub3BzID0gJm1wZnNfcmVz
ZXRfb3BzOw0KKyAgICAgICBjbGtfZGF0YS0+cmNkZXYub2Zfbm9kZSA9IGNsa19kYXRhLT5kZXYt
Pm9mX25vZGU7DQorICAgICAgIGNsa19kYXRhLT5yY2Rldi5vZl9yZXNldF9uX2NlbGxzID0gMTsN
CisgICAgICAgY2xrX2RhdGEtPnJjZGV2Lm9mX3hsYXRlID0gbXBmc19yZXNldF94bGF0ZTsNCisg
ICAgICAgLyogQ0xLX1JFU0VSVkVEIGlzIG5vdCBwYXJ0IG9mIG1wZnNfcGVyaXBoX2Nsa3MsIHNv
IGFkZCAxICovDQorICAgICAgIGNsa19kYXRhLT5yY2Rldi5ucl9yZXNldHMgPSBBUlJBWV9TSVpF
KG1wZnNfcGVyaXBoX2Nsa3MpICsgMTsNCisgICAgICAgcmV0dXJuIGRldm1fcmVzZXRfY29udHJv
bGxlcl9yZWdpc3RlcihjbGtfZGF0YS0+ZGV2LCAmY2xrX2RhdGEtPnJjZGV2KTsNCit9DQorDQor
I2Vsc2UgLyogIUNPTkZJR19SRVNFVF9DT05UUk9MTEVSICovDQorc3RhdGljIGludCBtcGZzX3Jl
c2V0X2NvbnRyb2xsZXJfcmVnaXN0ZXIoc3RydWN0IG1wZnNfY2xvY2tfZGF0YSAqY2xrX2RhdGEp
DQorew0KKyAgICAgICByZXR1cm4gMDsNCit9DQorI2VuZGlmIC8qICFDT05GSUdfUkVTRVRfQ09O
VFJPTExFUiAqLw0KKw0KIHN0YXRpYyBpbnQgbXBmc19jbGtfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCiB7DQogICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5k
ZXY7DQpAQCAtNDk2LDYgKzYwOCw3IEBAIHN0YXRpYyBpbnQgbXBmc19jbGtfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihj
bGtfZGF0YS0+bXNzcGxsX2Jhc2UpOw0KIA0KICAgICAgICBjbGtfZGF0YS0+aHdfZGF0YS5udW0g
PSBudW1fY2xrczsNCisgICAgICAgY2xrX2RhdGEtPmRldiA9IGRldjsNCiANCiAgICAgICAgcmV0
ID0gbXBmc19jbGtfcmVnaXN0ZXJfbXNzcGxscyhkZXYsIG1wZnNfbXNzcGxsX2Nsa3MsIEFSUkFZ
X1NJWkUobXBmc19tc3NwbGxfY2xrcyksDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY2xrX2RhdGEpOw0KQEAgLTUxNSw2ICs2MjgsMTAgQEAgc3RhdGljIGludCBtcGZz
X2Nsa19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KICAgICAgICBpZiAocmV0
KQ0KICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQogDQorICAgICAgIHJldCA9IG1wZnNfcmVz
ZXRfY29udHJvbGxlcl9yZWdpc3RlcihjbGtfZGF0YSk7DQorICAgICAgIGlmIChyZXQpDQorICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCisNCiAgICAgICAgcmV0dXJuIHJldDsNCiB9DQo=
