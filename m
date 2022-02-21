Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7368B4BDE88
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 18:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378822AbiBUPJ2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Feb 2022 10:09:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241858AbiBUPJ1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 10:09:27 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DBA19C35;
        Mon, 21 Feb 2022 07:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1645456141; x=1676992141;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zqubioYKyaV8ExbdiFISdfCFUb4CiiWe6lX8nDzO4Vo=;
  b=Eq3EwwlMsHXHMPuZk3pMc5L+8A74kMOGvhYlqu/udZc1K7odrcistfrl
   +AY2X5gHil04lTBzzJVX16AsgN6McRAbBQeCpMXcsLeGMQbuc4LK1MvR/
   eCJq6cope7uM5Cezq117tf517Kf8TGxwRB2Vpo09Z/3lwLp6iR6gP2Tgh
   J2A9v2uKSLt4K89FHZ+XJsNQnDw66jrKlevvyaaktxTrdV1qygiK1xL5G
   3gGT6/Oig3awm55G1Ai8s0yFSKwjnMbZJ4VueByfPLcCI/+2l43Np/ooW
   g9YFQxK5LA5vaz1ummYeN18G9bWtaqtN0PDUsR7V1QN2ETzXFMjd5qqOh
   g==;
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="149438640"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2022 08:08:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 21 Feb 2022 08:08:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 21 Feb 2022 08:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYDgGJF48J250qc3VarwLozJPHXOA2dpDSSJJpud06yKDATj9xDW+XRApb1wRpyCQZK665JcWUn39fFI6wivSsmHKcuyxeDO0CVtKv636poU+A/RmEcvDevhfQWcO1hBIbT22jdsO1OuJcrHH45/Y1quR9kaqTCEF8vlkpRpSf4jh15U2FZFPI0ybFOtLOtNvE7+NjiRuUNMgWR7AAfxVpJ4drZmeOWaoShhakNK96J/IxPkVU+kZMelIP4ueUXgKNvQA21GZC9qJIrgkO2KpOCAnQtYZRfBreH+UGIHCHfPEjR3cPCtlk13lXlGwICDbCVZvRnAn3Nk8VikTMffxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqubioYKyaV8ExbdiFISdfCFUb4CiiWe6lX8nDzO4Vo=;
 b=JYRbKnR7OkRC8jWbxypzdVL6DXgTdkPneTFCXfJN5VULxI5lXH3KJFnSqgDwsVhBfzaS0U7tkbTlxjNDLLK6CPNdGUlkUo3OQdb+l6upN5gXoGAXBUdWyyD7L8RzbR7Tpc/T/Sx8GPz/2JOyx1I8wD5QBcYftzm4z/XDSKIWFHGGeibSeWMHepD0hIbVbIFcOppMFSyvMXHT2VoC18J6AY0TE85fNFYLMcPahKOfi8eSGyKDZzL6XltqFrAe+bM86IDZ7gG639bUyzuokIYaLCAZa303y+LhMv00S4qAvyBqQzewwF03+PSutxgpsIYmeuLO9x8UxIm8CzHAcupXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqubioYKyaV8ExbdiFISdfCFUb4CiiWe6lX8nDzO4Vo=;
 b=Q9cQRYp+Z4BjqD9LzuboygxpAepYVxo7LkuQ0D2glj8VM1f/KJacQyiCK/BitNA6DKObIcWbBmBqMg+1BJvRdRB7qH3GJMydZTuCbD9rISpxZT9WtNXl6z8cKlCgRgTskAjAf9XUXma+ePK2EQV8ENkiiErPG8I5+e0+3saULb4=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by BL0PR11MB2914.namprd11.prod.outlook.com (2603:10b6:208:77::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 15:08:39 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec%4]) with mapi id 15.20.4995.016; Mon, 21 Feb 2022
 15:08:39 +0000
From:   <Conor.Dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <robh+dt@kernel.org>, <david.abdurachmanov@gmail.com>,
        <palmer@dabbelt.com>, <Daire.McNamara@microchip.com>,
        <Cyril.Jean@microchip.com>, <Padmarao.Begari@microchip.com>
Subject: Re: [PATCH v10 RESEND 1/1] clk: microchip: Add driver for Microchip
 PolarFire SoC
Thread-Topic: [PATCH v10 RESEND 1/1] clk: microchip: Add driver for Microchip
 PolarFire SoC
Thread-Index: AQHYJx3jXThNSzekX0Oo2lZJ+vKUyayeHImA
Date:   Mon, 21 Feb 2022 15:08:39 +0000
Message-ID: <9e343026-46ad-8bdf-6703-9fb06927be6e@microchip.com>
References: <20220221122653.1527949-1-conor.dooley@microchip.com>
 <20220221122653.1527949-2-conor.dooley@microchip.com>
In-Reply-To: <20220221122653.1527949-2-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6255f2a7-4b05-4ac4-0618-08d9f54c0ad4
x-ms-traffictypediagnostic: BL0PR11MB2914:EE_
x-microsoft-antispam-prvs: <BL0PR11MB2914CC8C26F799F2663B561A983A9@BL0PR11MB2914.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h4Rce2/oMxRQfnqK04GgQLT7lu4pJ4Qbtfl84lmrNa+pxywVbre08nP+Pg3F0ZJxo5mUvBVkpVnYiyWVdQ3x3F7Tg9YeLTM7KZUQ1j3CiefUlf1GpGqs1fxDllU2SOo3JSDVyEAjUaKJvKox9TEvVAFNr3qNqfAz6NXtdBByhCNUE6NWIilD2XYvvh7FlaA1LEH+9fjYeXDSW9MRd07AmuR8sX/hWY2Hwjg/iCpBnTVZ2OSfAUS9qh9PsQ8K+/QfYyjMhGdNuBkScyBMdRnnzstF/OfQBQWZtHQWM5w0fzAPey1Jy6r9NfnWqZzlvXM8nsVbcL/OzFQn3a+h1spXQHGpFRiGzzYyheBgbjF6XviF1JDyb81zSBpbz7tfEizBhH4y0cMgUUFOu4U9nkk2qSQKxkIJSDbjyr0bDeof+//JHwM3bGGpmqXyH63Ee1ZXpxfZiKxp6/Wi0Mq5SboBi/8D3pj9VA1mAtf51n4+VPeqfDJsOjZL5dmfMwQ/OONErulLAyVSDCvrsihOvEcL5522Eq5JqVsTQjBRaanBTW+A3ysNz4l3uHbpExQOjvNsf9RvevvI5qI6ZaQQXCwnTij4KWkTFI6J1LofSb0xOGydgQRRqQnkteg4F3LYE3iC4lYLd0hGh2vU60DxbWDMGVLB2blJiXRGlGoMM9LP3shwFCFIU35b6BXI8TCMK8QjG4fd1ct8fOfHap+n5TzvA37sUCk+pGzX6ZGpWN4Isb59ruJVKlc5K99fY7sKJCDfE8+KMVwJZJHidc9qtzfi0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66446008)(64756008)(66556008)(66946007)(91956017)(76116006)(2906002)(6486002)(53546011)(8936002)(8676002)(4326008)(38070700005)(38100700002)(6512007)(6506007)(122000001)(508600001)(30864003)(86362001)(5660300002)(316002)(2616005)(71200400001)(107886003)(36756003)(31696002)(186003)(26005)(83380400001)(31686004)(110136005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z084b0MxaFZOaEZTbVN0Titidk5ydk0ySWVaNHlJdko1MVljYTJxVllLaHdQ?=
 =?utf-8?B?RHlIdVA1VGplSmZjaXFoRVlDczBlU1VERTRNWlplaU1UaW1IeHprdy9ReXkr?=
 =?utf-8?B?RVZqcnRUSDJtY3FJajZtTHpHYjhzblBaVytDSk5DdVpjTHRIZ1gwNml6SE1E?=
 =?utf-8?B?cTBVd0laQW9wMklTUitHazk0S3RkL2daRXUyVzJVOE5CVGRtZXdtM0JtSE1M?=
 =?utf-8?B?TXhTdEpRZHF6bEd6RHQ3dTlkSTE4Q2VmU1oxak9SWE9NaEFTbCtqMlBKL2ds?=
 =?utf-8?B?M1U1YzlzZUh2ZlFKR2xtMnJwaEF5NldTRzlaUW45UlEwYmxvVUZER2xDK0RS?=
 =?utf-8?B?YUwzd1ovdDBqdHFMVU9nQ0tVN2RKeitXclE4bkN0ekpLMm5yNXFERHhtVlFS?=
 =?utf-8?B?NTFWNEVaZ3ZDWHFSRDRDZ2syNEYrTUgwUFlNeWJDTU9NWEhSUURjODZyNTlL?=
 =?utf-8?B?dStsenZCeTJ2WXk3Ri9qMXIzYnNOVFNwZkxWKzJsYUlTMUFEQ2VxV1RUYk1x?=
 =?utf-8?B?YWNORGJQVmd1OE5LWDJqSWh5M2I1WGd5SXE4dEFJVTVMZWw1eFIzMVdLOTIy?=
 =?utf-8?B?YnM1cXo3L0RRVFl5RU9scGNLSmJPVDNiV3FaK1FEbjF2R0c5N00reExSanM3?=
 =?utf-8?B?RTB3TUVxalZwbXpJY28vcFRrSGFJODk2VnBlMFJjRDdnYS9HeWEzcmk0WllO?=
 =?utf-8?B?T3Z0MThnNGZZNUtvMDloZ1JpRitFYlBtZXJUSFZuU0Exb0JPd0YrSFJ0ZnJ1?=
 =?utf-8?B?aXlpa0NQNVNhQ2VxWUlrSEVQTDNEUTRoaHVXclQrVkVjbksvME1Wbm9razVq?=
 =?utf-8?B?NEVjNjUwNUExcnVqQW5VNmdMMUFoUkpSajgrYzFqYU1wZ0Z2WXBjRlVRbkhO?=
 =?utf-8?B?aXd4VDNpdHlhQ2haQ05sN1dLOEVGemhXK2JoRXJnT0tWKzhRS0IvbG12UFdq?=
 =?utf-8?B?NGZDQWt3K2J6a21ZU1dmRWFGejlNa1pGbGZubitxdFZpeUZ3N25PYklzRkRw?=
 =?utf-8?B?Ly9nZlRnbGd5WWhuWTZDbHJjRHlRNDQ1aW5Ea3d3cHNrMVNvdW1TeGE5NnAx?=
 =?utf-8?B?WFVtbjl3S2FIRStGRUZEd0ZuY2dkcm80UVBxTnlFZ0Y4alc4MHZtVXZCRFYv?=
 =?utf-8?B?MWpnMmJ6L3JXOC8rcHR5QWxvU0gybFpmM0w2MlBXMDZiVnVQN2d0dERlRlNQ?=
 =?utf-8?B?RWVvc3BFaUJ2UUxsVEt3RmYzYjlUVGYzOXV0cDF3QzVtL0hBV1VycUV5L1U3?=
 =?utf-8?B?Y2N3ZmRpazZzK2svNkhIczAxbUxuU2RZU0ZleHNXYS9TMGIwdlQ3dGdNYmFo?=
 =?utf-8?B?elNKUUN6MWRQcm1NbDBsMUtKeXRnNldBNlZEZFo1YmhxazhXUG1QdzhoRENq?=
 =?utf-8?B?YWNGc1JuTlY5ZFFhb3QzNjNDNnNHYnBnNXR2TUY4SW5Cc01mVUFoOHVnK3JX?=
 =?utf-8?B?WkdIS0syTWVUTUJQWUJaZEVUZXBiYVluWElndjExdy9vRi9jY1ptMkZYa3dL?=
 =?utf-8?B?OHFFaGJzM29DdXMrNVI1OUhrNms2V29oM1E3L3haNHM0cHdzUUVTbmdMWU9T?=
 =?utf-8?B?WjhqV25kRDR3OXMwQnhBZGFnL1c2UnJUUVhxUDk0dlFXNEZxREpyRGNpUUtw?=
 =?utf-8?B?WXRZSURFOGFtdDNrTkdSb1B4WDRXd0RCcGh5bVRVZStndjA3eHdPc01ta2d6?=
 =?utf-8?B?L0NBVjBjSThSR0k3VlhlWllZbk5CbDd0UmlyM2ZIZEZwNUp1MEU1YUM3RzRZ?=
 =?utf-8?B?bU5RaGlOdG82U2g0WXFGMGRzWkxMd2dvaEtFSm9MKys5WGJldFYrajdKQ3Jv?=
 =?utf-8?B?UmNaOEFYV1dyOHV2cWNkcjc3elJXT1VmbU5kZm9kRmtLNExKRktkc0YxY2Rk?=
 =?utf-8?B?Z0tUNTY1Vnd6UWlZRW44T3RKclJzNnB1VlJFN1Qxa0IxNWtWYmwzdUdqZi9Z?=
 =?utf-8?B?VVdIdlVhODRZeGxOZWxhUHVmVTg4T0JienBPWGF6Qjk0SW5CK3g5NnZaVDJD?=
 =?utf-8?B?MUs1ZDJYR2QzaTVCN0FmOGRPV1FnUUlHSlpMQnhRaEJUOWZEejcrOVA2eWtv?=
 =?utf-8?B?clIzaDExMkc1K2ZHTVN3dlg2WGJYYVF0QUc5UlFpRWpoMDh0TVBxaTJla0hi?=
 =?utf-8?B?dEJzWWpDd0d5bkI2dk1nSmxFamJJRFAvRjd5ZWRMSFFPY25QQTZnQnlyVW5D?=
 =?utf-8?B?QkRSMkJHVG5ISHhkdHBqY2lLQ050WldMZVpaRVorWU5hZ2pORFI3Um5ybUgy?=
 =?utf-8?B?Y2dpMmJwNnRrMVhQREZNYVdSTUtnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD7FA92CE206BA468BA5F0DAD940A9B3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6255f2a7-4b05-4ac4-0618-08d9f54c0ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 15:08:39.6216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFw97+vMiRvSkBqv7UNPgpQzZ0RVydp/ZLe1qawgC6wc7Gyx9G65hLHmQ3K9mXFmMWYrz3ZxBKCPJBpgpiaHv3ZwCp8ZHAL/80KFrq024u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2914
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGFkIGEgbG9vayBhdCB0aGlzIGFmdGVyIHJlc2VuZGluZyB0b2RheSwgdGhlIGRpdmlkZXIgZmxh
Z3MgSSBhZGRlZCBpbiANClYxMCBhcmUgd3JvbmcuDQpJJ2xsIHNlbmQgYSBWMTEgdG9tb3Jyb3cg
d2l0aCB0aGVtIGZpeGVkLg0KDQpUaGFua3MsDQpDb25vci4NCg0KT24gMjEvMDIvMjAyMiAxMjoy
NiwgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+IEZyb206IERhaXJlIE1jTmFt
YXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPg0KPiANCj4gQWRkIHN1cHBvcnQgZm9y
IGNsb2NrIGNvbmZpZ3VyYXRpb24gb24gTWljcm9jaGlwIFBvbGFyRmlyZSBTb0MNCj4gDQo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBU
ZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IA0K
PiBDby1kZXZlbG9wZWQtYnk6IFBhZG1hcmFvIEJlbmdhcmkgPHBhZG1hcmFvLmJlZ2FyaUBtaWNy
b2NoaXAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQYWRtYXJhbyBCZW5nYXJpIDxwYWRtYXJhby5i
ZWdhcmlAbWljcm9jaGlwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGFpcmUgTWNOYW1hcmEgPGRh
aXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9j
bGsvS2NvbmZpZyAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gICBkcml2ZXJzL2Nsay9NYWtlZmls
ZSAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgIGRyaXZlcnMvY2xrL21pY3JvY2hpcC9LY29uZmln
ICAgIHwgIDEwICsNCj4gICBkcml2ZXJzL2Nsay9taWNyb2NoaXAvTWFrZWZpbGUgICB8ICAgMSAr
DQo+ICAgZHJpdmVycy9jbGsvbWljcm9jaGlwL2Nsay1tcGZzLmMgfCAzODIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMzk1IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21p
Y3JvY2hpcC9LY29uZmlnDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21pY3Jv
Y2hpcC9jbGstbXBmcy5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvS2NvbmZpZyBi
L2RyaXZlcnMvY2xrL0tjb25maWcNCj4gaW5kZXggYWQ0MjU2ZDU0MzYxLi42NzhhODY1MDIxZTIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9jbGsv
S2NvbmZpZw0KPiBAQCAtMzMwLDkgKzMzMCw2IEBAIGNvbmZpZyBDT01NT05fQ0xLX1BYQQ0KPiAg
IAloZWxwDQo+ICAgCSAgU3VwcG9ydCBmb3IgdGhlIE1hcnZlbGwgUFhBIFNvQy4NCj4gICANCj4g
LWNvbmZpZyBDT01NT05fQ0xLX1BJQzMyDQo+IC0JZGVmX2Jvb2wgQ09NTU9OX0NMSyAmJiBNQUNI
X1BJQzMyDQo+IC0NCj4gICBjb25maWcgQ09NTU9OX0NMS19PWE5BUw0KPiAgIAlib29sICJDbG9j
ayBkcml2ZXIgZm9yIHRoZSBPWE5BUyBTb0MgRmFtaWx5Ig0KPiAgIAlkZXBlbmRzIG9uIEFSQ0hf
T1hOQVMgfHwgQ09NUElMRV9URVNUDQo+IEBAIC00MDcsNiArNDA0LDcgQEAgc291cmNlICJkcml2
ZXJzL2Nsay9rZXlzdG9uZS9LY29uZmlnIg0KPiAgIHNvdXJjZSAiZHJpdmVycy9jbGsvbWVkaWF0
ZWsvS2NvbmZpZyINCj4gICBzb3VyY2UgImRyaXZlcnMvY2xrL21lc29uL0tjb25maWciDQo+ICAg
c291cmNlICJkcml2ZXJzL2Nsay9tc3Rhci9LY29uZmlnIg0KPiArc291cmNlICJkcml2ZXJzL2Ns
ay9taWNyb2NoaXAvS2NvbmZpZyINCj4gICBzb3VyY2UgImRyaXZlcnMvY2xrL212ZWJ1L0tjb25m
aWciDQo+ICAgc291cmNlICJkcml2ZXJzL2Nsay9waXN0YWNoaW8vS2NvbmZpZyINCj4gICBzb3Vy
Y2UgImRyaXZlcnMvY2xrL3Fjb20vS2NvbmZpZyINCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L01ha2VmaWxlIGIvZHJpdmVycy9jbGsvTWFrZWZpbGUNCj4gaW5kZXggMTZlNTg4NjMwNDcyLi42
MTI3MTkyNmIxNmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL01ha2VmaWxlDQo+ICsrKyBi
L2RyaXZlcnMvY2xrL01ha2VmaWxlDQo+IEBAIC05MSw3ICs5MSw3IEBAIG9iai0kKENPTkZJR19B
UkNIX0tFWVNUT05FKQkJKz0ga2V5c3RvbmUvDQo+ICAgb2JqLSQoQ09ORklHX01BQ0hfTE9PTkdT
T04zMikJCSs9IGxvb25nc29uMS8NCj4gICBvYmoteQkJCQkJKz0gbWVkaWF0ZWsvDQo+ICAgb2Jq
LSQoQ09ORklHX0FSQ0hfTUVTT04pCQkrPSBtZXNvbi8NCj4gLW9iai0kKENPTkZJR19NQUNIX1BJ
QzMyKQkJKz0gbWljcm9jaGlwLw0KPiArb2JqLXkJCQkJCSs9IG1pY3JvY2hpcC8NCj4gICBpZmVx
ICgkKENPTkZJR19DT01NT05fQ0xLKSwgeSkNCj4gICBvYmotJChDT05GSUdfQVJDSF9NTVApCQkJ
Kz0gbW1wLw0KPiAgIGVuZGlmDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9taWNyb2NoaXAv
S2NvbmZpZyBiL2RyaXZlcnMvY2xrL21pY3JvY2hpcC9LY29uZmlnDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTFhZjM4MGQ4YzljDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvZHJpdmVycy9jbGsvbWljcm9jaGlwL0tjb25maWcNCj4gQEAgLTAsMCArMSwx
MCBAQA0KPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArDQo+ICtjb25m
aWcgQ09NTU9OX0NMS19QSUMzMg0KPiArCWRlZl9ib29sIENPTU1PTl9DTEsgJiYgTUFDSF9QSUMz
Mg0KPiArDQo+ICtjb25maWcgTUNIUF9DTEtfTVBGUw0KPiArCWJvb2wgIkNsayBkcml2ZXIgZm9y
IFBvbGFyRmlyZSBTb0MiDQo+ICsJZGVwZW5kcyBvbiAoUklTQ1YgJiYgU09DX01JQ1JPQ0hJUF9Q
T0xBUkZJUkUpIHx8IENPTVBJTEVfVEVTVA0KPiArCWhlbHANCj4gKwkgIFN1cHBvcnRzIENsb2Nr
IENvbmZpZ3VyYXRpb24gZm9yIFBvbGFyRmlyZSBTb0MNCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBv
ZiBmaWxlDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9taWNyb2NoaXAvTWFrZWZpbGUgYi9k
cml2ZXJzL2Nsay9taWNyb2NoaXAvTWFrZWZpbGUNCj4gaW5kZXggZjM0YjI0N2U4NzBmLi41ZmE2
ZGNmMzBhOWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL21pY3JvY2hpcC9NYWtlZmlsZQ0K
PiArKysgYi9kcml2ZXJzL2Nsay9taWNyb2NoaXAvTWFrZWZpbGUNCj4gQEAgLTEsMyArMSw0IEBA
DQo+ICAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ICAgb2JqLSQo
Q09ORklHX0NPTU1PTl9DTEtfUElDMzIpICs9IGNsay1jb3JlLm8NCj4gICBvYmotJChDT05GSUdf
UElDMzJNWkRBKSArPSBjbGstcGljMzJtemRhLm8NCj4gK29iai0kKENPTkZJR19NQ0hQX0NMS19N
UEZTKSArPSBjbGstbXBmcy5vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9taWNyb2NoaXAv
Y2xrLW1wZnMuYyBiL2RyaXZlcnMvY2xrL21pY3JvY2hpcC9jbGstbXBmcy5jDQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWVjNDYxYjkwNmQ4DQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9jbGsvbWljcm9jaGlwL2Nsay1tcGZzLmMNCj4gQEAg
LTAsMCArMSwzODIgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkNCj4gKy8qDQo+ICsgKiBEYWlyZSBNY05hbWFyYSw8ZGFpcmUubWNuYW1hcmFAbWljcm9jaGlw
LmNvbT4NCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMCBNaWNyb2NoaXAgVGVjaG5vbG9neSBJbmMu
ICBBbGwgcmlnaHRzIHJlc2VydmVkLg0KPiArICovDQo+ICsjaW5jbHVkZSA8bGludXgvY2xrLXBy
b3ZpZGVyLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gKyNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+DQo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbWljcm9j
aGlwLG1wZnMtY2xvY2suaD4NCj4gKw0KPiArLyogYWRkcmVzcyBvZmZzZXQgb2YgY29udHJvbCBy
ZWdpc3RlcnMgKi8NCj4gKyNkZWZpbmUgUkVHX0NMT0NLX0NPTkZJR19DUgkweDA4dQ0KPiArI2Rl
ZmluZSBSRUdfU1VCQkxLX0NMT0NLX0NSCTB4ODR1DQo+ICsjZGVmaW5lIFJFR19TVUJCTEtfUkVT
RVRfQ1IJMHg4OHUNCj4gKw0KPiArc3RydWN0IG1wZnNfY2xvY2tfZGF0YSB7DQo+ICsJdm9pZCBf
X2lvbWVtICpiYXNlOw0KPiArCXN0cnVjdCBjbGtfaHdfb25lY2VsbF9kYXRhIGh3X2RhdGE7DQo+
ICt9Ow0KPiArDQo+ICtzdHJ1Y3QgbXBmc19jZmdfY2xvY2sgew0KPiArCWNvbnN0IHN0cnVjdCBj
bGtfZGl2X3RhYmxlICp0YWJsZTsNCj4gKwl1bnNpZ25lZCBpbnQgaWQ7DQo+ICsJdTggc2hpZnQ7
DQo+ICsJdTggd2lkdGg7DQo+ICt9Ow0KPiArDQo+ICtzdHJ1Y3QgbXBmc19jZmdfaHdfY2xvY2sg
ew0KPiArCXN0cnVjdCBtcGZzX2NmZ19jbG9jayBjZmc7DQo+ICsJdm9pZCBfX2lvbWVtICpzeXNf
YmFzZTsNCj4gKwlzdHJ1Y3QgY2xrX2h3IGh3Ow0KPiArCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGlu
aXQ7DQo+ICt9Ow0KPiArDQo+ICsjZGVmaW5lIHRvX21wZnNfY2ZnX2NsayhfaHcpIGNvbnRhaW5l
cl9vZihfaHcsIHN0cnVjdCBtcGZzX2NmZ19od19jbG9jaywgaHcpDQo+ICsNCj4gK3N0cnVjdCBt
cGZzX3BlcmlwaF9jbG9jayB7DQo+ICsJdW5zaWduZWQgaW50IGlkOw0KPiArCXU4IHNoaWZ0Ow0K
PiArfTsNCj4gKw0KPiArc3RydWN0IG1wZnNfcGVyaXBoX2h3X2Nsb2NrIHsNCj4gKwlzdHJ1Y3Qg
bXBmc19wZXJpcGhfY2xvY2sgcGVyaXBoOw0KPiArCXZvaWQgX19pb21lbSAqc3lzX2Jhc2U7DQo+
ICsJc3RydWN0IGNsa19odyBodzsNCj4gK307DQo+ICsNCj4gKyNkZWZpbmUgdG9fbXBmc19wZXJp
cGhfY2xrKF9odykgY29udGFpbmVyX29mKF9odywgc3RydWN0IG1wZnNfcGVyaXBoX2h3X2Nsb2Nr
LCBodykNCj4gKw0KPiArLyoNCj4gKyAqIG1wZnNfY2xrX2xvY2sgcHJldmVudHMgYW55dGhpbmcg
ZWxzZSBmcm9tIHdyaXRpbmcgdG8gdGhlDQo+ICsgKiBtcGZzIGNsayBibG9jayB3aGlsZSBhIHNv
ZnR3YXJlIGxvY2tlZCByZWdpc3RlciBpcyBiZWluZyB3cml0dGVuLg0KPiArICovDQo+ICtzdGF0
aWMgREVGSU5FX1NQSU5MT0NLKG1wZnNfY2xrX2xvY2spOw0KPiArDQo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGNsa19wYXJlbnRfZGF0YSBtcGZzX2NmZ19wYXJlbnRbXSA9IHsNCj4gKwl7IC5pbmRl
eCA9IDAgfSwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJs
ZSBtcGZzX2Rpdl9jcHVfYXhpX3RhYmxlW10gPSB7DQo+ICsJeyAwLCAxIH0sIHsgMSwgMiB9LCB7
IDIsIDQgfSwgeyAzLCA4IH0sDQo+ICsJeyAwLCAwIH0NCj4gK307DQo+ICsNCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJsZSBtcGZzX2Rpdl9haGJfdGFibGVbXSA9IHsNCj4gKwl7
IDEsIDIgfSwgeyAyLCA0fSwgeyAzLCA4IH0sDQo+ICsJeyAwLCAwIH0NCj4gK307DQo+ICsNCj4g
K3N0YXRpYyB1bnNpZ25lZCBsb25nIG1wZnNfY2ZnX2Nsa19yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xr
X2h3ICpodywgdW5zaWduZWQgbG9uZyBwcmF0ZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgbXBmc19jZmdf
aHdfY2xvY2sgKmNmZ19odyA9IHRvX21wZnNfY2ZnX2Nsayhodyk7DQo+ICsJc3RydWN0IG1wZnNf
Y2ZnX2Nsb2NrICpjZmcgPSAmY2ZnX2h3LT5jZmc7DQo+ICsJdm9pZCBfX2lvbWVtICpiYXNlX2Fk
ZHIgPSBjZmdfaHctPnN5c19iYXNlOw0KPiArCXUzMiB2YWw7DQo+ICsNCj4gKwl2YWwgPSByZWFk
bF9yZWxheGVkKGJhc2VfYWRkciArIFJFR19DTE9DS19DT05GSUdfQ1IpID4+IGNmZy0+c2hpZnQ7
DQo+ICsJdmFsICY9IGNsa19kaXZfbWFzayhjZmctPndpZHRoKTsNCj4gKw0KPiArCXJldHVybiBw
cmF0ZSAvICgxdSA8PCB2YWwpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgbG9uZyBtcGZzX2NmZ19j
bGtfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLCB1bnNp
Z25lZCBsb25nICpwcmF0ZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgbXBmc19jZmdfaHdfY2xvY2sgKmNm
Z19odyA9IHRvX21wZnNfY2ZnX2Nsayhodyk7DQo+ICsJc3RydWN0IG1wZnNfY2ZnX2Nsb2NrICpj
ZmcgPSAmY2ZnX2h3LT5jZmc7DQo+ICsNCj4gKwlyZXR1cm4gZGl2aWRlcl9yb3VuZF9yYXRlKGh3
LCByYXRlLCBwcmF0ZSwgY2ZnLT50YWJsZSwgY2ZnLT53aWR0aCwgQ0xLX0RJVklERVJfT05FX0JB
U0VEKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBtcGZzX2NmZ19jbGtfc2V0X3JhdGUoc3Ry
dWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwgdW5zaWduZWQgbG9uZyBwcmF0ZSkN
Cj4gK3sNCj4gKwlzdHJ1Y3QgbXBmc19jZmdfaHdfY2xvY2sgKmNmZ19odyA9IHRvX21wZnNfY2Zn
X2Nsayhodyk7DQo+ICsJc3RydWN0IG1wZnNfY2ZnX2Nsb2NrICpjZmcgPSAmY2ZnX2h3LT5jZmc7
DQo+ICsJdm9pZCBfX2lvbWVtICpiYXNlX2FkZHIgPSBjZmdfaHctPnN5c19iYXNlOw0KPiArCXVu
c2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsJdTMyIHZhbDsNCj4gKwlpbnQgZGl2aWRlcl9zZXR0aW5n
Ow0KPiArDQo+ICsJZGl2aWRlcl9zZXR0aW5nID0gZGl2aWRlcl9nZXRfdmFsKHJhdGUsIHByYXRl
LCBjZmctPnRhYmxlLCBjZmctPndpZHRoLA0KPiArCQkJCQkgIENMS19ESVZJREVSX09ORV9CQVNF
RCk7DQo+ICsNCj4gKwlpZiAoZGl2aWRlcl9zZXR0aW5nIDwgMCkNCj4gKwkJcmV0dXJuIGRpdmlk
ZXJfc2V0dGluZzsNCj4gKw0KPiArCXNwaW5fbG9ja19pcnFzYXZlKCZtcGZzX2Nsa19sb2NrLCBm
bGFncyk7DQo+ICsNCj4gKwl2YWwgPSByZWFkbF9yZWxheGVkKGJhc2VfYWRkciArIFJFR19DTE9D
S19DT05GSUdfQ1IpOw0KPiArCXZhbCAmPSB+KGNsa19kaXZfbWFzayhjZmctPndpZHRoKSA8PCBj
ZmdfaHctPmNmZy5zaGlmdCk7DQo+ICsJdmFsIHw9IGRpdmlkZXJfc2V0dGluZyA8PCBjZmctPnNo
aWZ0Ow0KPiArCXdyaXRlbF9yZWxheGVkKHZhbCwgYmFzZV9hZGRyICsgUkVHX0NMT0NLX0NPTkZJ
R19DUik7DQo+ICsNCj4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtcGZzX2Nsa19sb2NrLCBm
bGFncyk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBjbGtfb3BzIG1wZnNfY2xrX2NmZ19vcHMgPSB7DQo+ICsJLnJlY2FsY19yYXRlID0gbXBm
c19jZmdfY2xrX3JlY2FsY19yYXRlLA0KPiArCS5yb3VuZF9yYXRlID0gbXBmc19jZmdfY2xrX3Jv
dW5kX3JhdGUsDQo+ICsJLnNldF9yYXRlID0gbXBmc19jZmdfY2xrX3NldF9yYXRlLA0KPiArfTsN
Cj4gKw0KPiArI2RlZmluZSBDTEtfQ0ZHKF9pZCwgX25hbWUsIF9wYXJlbnQsIF9zaGlmdCwgX3dp
ZHRoLCBfdGFibGUsIF9mbGFncykgewkJXA0KPiArCS5jZmcuaWQgPSBfaWQsCQkJCQkJCQlcDQo+
ICsJLmNmZy5zaGlmdCA9IF9zaGlmdCwJCQkJCQkJXA0KPiArCS5jZmcud2lkdGggPSBfd2lkdGgs
CQkJCQkJCVwNCj4gKwkuY2ZnLnRhYmxlID0gX3RhYmxlLAkJCQkJCQlcDQo+ICsJLmh3LmluaXQg
PSBDTEtfSFdfSU5JVF9QQVJFTlRTX0RBVEEoX25hbWUsIF9wYXJlbnQsICZtcGZzX2Nsa19jZmdf
b3BzLAlcDQo+ICsJCQkJCSAgICBfZmxhZ3MpLAkJCQlcDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBz
dHJ1Y3QgbXBmc19jZmdfaHdfY2xvY2sgbXBmc19jZmdfY2xrc1tdID0gew0KPiArCUNMS19DRkco
Q0xLX0NQVSwgImNsa19jcHUiLCBtcGZzX2NmZ19wYXJlbnQsIDAsIDIsIG1wZnNfZGl2X2NwdV9h
eGlfdGFibGUsIDApLA0KPiArCUNMS19DRkcoQ0xLX0FYSSwgImNsa19heGkiLCBtcGZzX2NmZ19w
YXJlbnQsIDIsIDIsIG1wZnNfZGl2X2NwdV9heGlfdGFibGUsIDApLA0KPiArCUNMS19DRkcoQ0xL
X0FIQiwgImNsa19haGIiLCBtcGZzX2NmZ19wYXJlbnQsIDQsIDIsIG1wZnNfZGl2X2FoYl90YWJs
ZSwgMCksDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW50IG1wZnNfY2xrX3JlZ2lzdGVyX2NmZyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtcGZzX2NmZ19od19jbG9jayAqY2ZnX2h3LA0KPiAr
CQkJCSB2b2lkIF9faW9tZW0gKnN5c19iYXNlKQ0KPiArew0KPiArCWNmZ19ody0+c3lzX2Jhc2Ug
PSBzeXNfYmFzZTsNCj4gKw0KPiArCXJldHVybiBkZXZtX2Nsa19od19yZWdpc3RlcihkZXYsICZj
ZmdfaHctPmh3KTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBtcGZzX2Nsa19yZWdpc3Rlcl9j
ZmdzKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG1wZnNfY2ZnX2h3X2Nsb2NrICpjZmdfaHdz
LA0KPiArCQkJCSAgdW5zaWduZWQgaW50IG51bV9jbGtzLCBzdHJ1Y3QgbXBmc19jbG9ja19kYXRh
ICpkYXRhKQ0KPiArew0KPiArCXZvaWQgX19pb21lbSAqc3lzX2Jhc2UgPSBkYXRhLT5iYXNlOw0K
PiArCXVuc2lnbmVkIGludCBpLCBpZDsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJZm9yIChpID0g
MDsgaSA8IG51bV9jbGtzOyBpKyspIHsNCj4gKwkJc3RydWN0IG1wZnNfY2ZnX2h3X2Nsb2NrICpj
ZmdfaHcgPSAmY2ZnX2h3c1tpXTsNCj4gKw0KPiArCQlyZXQgPSBtcGZzX2Nsa19yZWdpc3Rlcl9j
ZmcoZGV2LCBjZmdfaHcsIHN5c19iYXNlKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGNsb2NrIGlkOiAlZFxu
IiwNCj4gKwkJCQkJICAgICBjZmdfaHctPmNmZy5pZCk7DQo+ICsNCj4gKwkJaWQgPSBjZmdfaHdz
W2ldLmNmZy5pZDsNCj4gKwkJZGF0YS0+aHdfZGF0YS5od3NbaWRdID0gJmNmZ19ody0+aHc7DQo+
ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgbXBmc19w
ZXJpcGhfY2xrX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykNCj4gK3sNCj4gKwlzdHJ1Y3QgbXBm
c19wZXJpcGhfaHdfY2xvY2sgKnBlcmlwaF9odyA9IHRvX21wZnNfcGVyaXBoX2Nsayhodyk7DQo+
ICsJc3RydWN0IG1wZnNfcGVyaXBoX2Nsb2NrICpwZXJpcGggPSAmcGVyaXBoX2h3LT5wZXJpcGg7
DQo+ICsJdm9pZCBfX2lvbWVtICpiYXNlX2FkZHIgPSBwZXJpcGhfaHctPnN5c19iYXNlOw0KPiAr
CXUzMiByZWcsIHZhbDsNCj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArDQo+ICsJc3Bpbl9s
b2NrX2lycXNhdmUoJm1wZnNfY2xrX2xvY2ssIGZsYWdzKTsNCj4gKw0KPiArCXJlZyA9IHJlYWRs
X3JlbGF4ZWQoYmFzZV9hZGRyICsgUkVHX1NVQkJMS19SRVNFVF9DUik7DQo+ICsJdmFsID0gcmVn
ICYgfigxdSA8PCBwZXJpcGgtPnNoaWZ0KTsNCj4gKwl3cml0ZWxfcmVsYXhlZCh2YWwsIGJhc2Vf
YWRkciArIFJFR19TVUJCTEtfUkVTRVRfQ1IpOw0KPiArDQo+ICsJcmVnID0gcmVhZGxfcmVsYXhl
ZChiYXNlX2FkZHIgKyBSRUdfU1VCQkxLX0NMT0NLX0NSKTsNCj4gKwl2YWwgPSByZWcgfCAoMXUg
PDwgcGVyaXBoLT5zaGlmdCk7DQo+ICsJd3JpdGVsX3JlbGF4ZWQodmFsLCBiYXNlX2FkZHIgKyBS
RUdfU1VCQkxLX0NMT0NLX0NSKTsNCj4gKw0KPiArCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1w
ZnNfY2xrX2xvY2ssIGZsYWdzKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtz
dGF0aWMgdm9pZCBtcGZzX3BlcmlwaF9jbGtfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykNCj4g
K3sNCj4gKwlzdHJ1Y3QgbXBmc19wZXJpcGhfaHdfY2xvY2sgKnBlcmlwaF9odyA9IHRvX21wZnNf
cGVyaXBoX2Nsayhodyk7DQo+ICsJc3RydWN0IG1wZnNfcGVyaXBoX2Nsb2NrICpwZXJpcGggPSAm
cGVyaXBoX2h3LT5wZXJpcGg7DQo+ICsJdm9pZCBfX2lvbWVtICpiYXNlX2FkZHIgPSBwZXJpcGhf
aHctPnN5c19iYXNlOw0KPiArCXUzMiByZWcsIHZhbDsNCj4gKwl1bnNpZ25lZCBsb25nIGZsYWdz
Ow0KPiArDQo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJm1wZnNfY2xrX2xvY2ssIGZsYWdzKTsNCj4g
Kw0KPiArCXJlZyA9IHJlYWRsX3JlbGF4ZWQoYmFzZV9hZGRyICsgUkVHX1NVQkJMS19SRVNFVF9D
Uik7DQo+ICsJdmFsID0gcmVnIHwgKDF1IDw8IHBlcmlwaC0+c2hpZnQpOw0KPiArCXdyaXRlbF9y
ZWxheGVkKHZhbCwgYmFzZV9hZGRyICsgUkVHX1NVQkJMS19SRVNFVF9DUik7DQo+ICsNCj4gKwly
ZWcgPSByZWFkbF9yZWxheGVkKGJhc2VfYWRkciArIFJFR19TVUJCTEtfQ0xPQ0tfQ1IpOw0KPiAr
CXZhbCA9IHJlZyAmIH4oMXUgPDwgcGVyaXBoLT5zaGlmdCk7DQo+ICsJd3JpdGVsX3JlbGF4ZWQo
dmFsLCBiYXNlX2FkZHIgKyBSRUdfU1VCQkxLX0NMT0NLX0NSKTsNCj4gKw0KPiArCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJm1wZnNfY2xrX2xvY2ssIGZsYWdzKTsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIGludCBtcGZzX3BlcmlwaF9jbGtfaXNfZW5hYmxlZChzdHJ1Y3QgY2xrX2h3ICpodykNCj4g
K3sNCj4gKwlzdHJ1Y3QgbXBmc19wZXJpcGhfaHdfY2xvY2sgKnBlcmlwaF9odyA9IHRvX21wZnNf
cGVyaXBoX2Nsayhodyk7DQo+ICsJc3RydWN0IG1wZnNfcGVyaXBoX2Nsb2NrICpwZXJpcGggPSAm
cGVyaXBoX2h3LT5wZXJpcGg7DQo+ICsJdm9pZCBfX2lvbWVtICpiYXNlX2FkZHIgPSBwZXJpcGhf
aHctPnN5c19iYXNlOw0KPiArCXUzMiByZWc7DQo+ICsNCj4gKwlyZWcgPSByZWFkbF9yZWxheGVk
KGJhc2VfYWRkciArIFJFR19TVUJCTEtfUkVTRVRfQ1IpOw0KPiArCWlmICgocmVnICYgKDF1IDw8
IHBlcmlwaC0+c2hpZnQpKSA9PSAwdSkgew0KPiArCQlyZWcgPSByZWFkbF9yZWxheGVkKGJhc2Vf
YWRkciArIFJFR19TVUJCTEtfQ0xPQ0tfQ1IpOw0KPiArCQlpZiAocmVnICYgKDF1IDw8IHBlcmlw
aC0+c2hpZnQpKQ0KPiArCQkJcmV0dXJuIDE7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+
ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBtcGZzX3BlcmlwaF9jbGtf
b3BzID0gew0KPiArCS5lbmFibGUgPSBtcGZzX3BlcmlwaF9jbGtfZW5hYmxlLA0KPiArCS5kaXNh
YmxlID0gbXBmc19wZXJpcGhfY2xrX2Rpc2FibGUsDQo+ICsJLmlzX2VuYWJsZWQgPSBtcGZzX3Bl
cmlwaF9jbGtfaXNfZW5hYmxlZCwNCj4gK307DQo+ICsNCj4gKyNkZWZpbmUgQ0xLX1BFUklQSChf
aWQsIF9uYW1lLCBfcGFyZW50LCBfc2hpZnQsIF9mbGFncykgewkJCVwNCj4gKwkucGVyaXBoLmlk
ID0gX2lkLAkJCQkJCQlcDQo+ICsJLnBlcmlwaC5zaGlmdCA9IF9zaGlmdCwJCQkJCQkJXA0KPiAr
CS5ody5pbml0ID0gQ0xLX0hXX0lOSVRfSFcoX25hbWUsIF9wYXJlbnQsICZtcGZzX3BlcmlwaF9j
bGtfb3BzLAkJXA0KPiArCQkJCSAgX2ZsYWdzKSwJCQkJCVwNCj4gK30NCj4gKw0KPiArI2RlZmlu
ZSBQQVJFTlRfQ0xLKFBBUkVOVCkgKCZtcGZzX2NmZ19jbGtzW0NMS18jI1BBUkVOVF0uaHcpDQo+
ICsNCj4gKy8qDQo+ICsgKiBDcml0aWNhbCBjbG9ja3M6DQo+ICsgKiAtIENMS19FTlZNOiByZXNl
cnZlZCBieSBoYXJ0IHNvZnR3YXJlIHNlcnZpY2VzIChoc3MpIHN1cGVybG9vcCBtb25pdG9yL20g
bW9kZSBpbnRlcnJ1cHQNCj4gKyAqICAgdHJhcCBoYW5kbGVyDQo+ICsgKiAtIENMS19NTVVBUlQw
OiByZXNlcnZlZCBieSB0aGUgaHNzDQo+ICsgKiAtIENMS19ERFJDOiBwcm92aWRlcyBjbG9jayB0
byB0aGUgZGRyIHN1YnN5c3RlbQ0KPiArICogLSBDTEtfRklDeDogdGhlc2UgcHJvdmlkZSBjbG9j
a3MgZm9yIHNlY3Rpb25zIG9mIHRoZSBmcGdhIGZhYnJpYywgZGlzYWJsaW5nIHRoZW0gd291bGQN
Cj4gKyAqICAgY2F1c2UgdGhlIGZhYnJpYyB0byBnbyBpbnRvIHJlc2V0DQo+ICsgKi8NCj4gKw0K
PiArc3RhdGljIHN0cnVjdCBtcGZzX3BlcmlwaF9od19jbG9jayBtcGZzX3BlcmlwaF9jbGtzW10g
PSB7DQo+ICsJQ0xLX1BFUklQSChDTEtfRU5WTSwgImNsa19wZXJpcGhfZW52bSIsIFBBUkVOVF9D
TEsoQUhCKSwgMCwgQ0xLX0lTX0NSSVRJQ0FMKSwNCj4gKwlDTEtfUEVSSVBIKENMS19NQUMwLCAi
Y2xrX3BlcmlwaF9tYWMwIiwgUEFSRU5UX0NMSyhBSEIpLCAxLCAwKSwNCj4gKwlDTEtfUEVSSVBI
KENMS19NQUMxLCAiY2xrX3BlcmlwaF9tYWMxIiwgUEFSRU5UX0NMSyhBSEIpLCAyLCAwKSwNCj4g
KwlDTEtfUEVSSVBIKENMS19NTUMsICJjbGtfcGVyaXBoX21tYyIsIFBBUkVOVF9DTEsoQUhCKSwg
MywgMCksDQo+ICsJQ0xLX1BFUklQSChDTEtfVElNRVIsICJjbGtfcGVyaXBoX3RpbWVyIiwgUEFS
RU5UX0NMSyhBSEIpLCA0LCAwKSwNCj4gKwlDTEtfUEVSSVBIKENMS19NTVVBUlQwLCAiY2xrX3Bl
cmlwaF9tbXVhcnQwIiwgUEFSRU5UX0NMSyhBSEIpLCA1LCBDTEtfSVNfQ1JJVElDQUwpLA0KPiAr
CUNMS19QRVJJUEgoQ0xLX01NVUFSVDEsICJjbGtfcGVyaXBoX21tdWFydDEiLCBQQVJFTlRfQ0xL
KEFIQiksIDYsIDApLA0KPiArCUNMS19QRVJJUEgoQ0xLX01NVUFSVDIsICJjbGtfcGVyaXBoX21t
dWFydDIiLCBQQVJFTlRfQ0xLKEFIQiksIDcsIDApLA0KPiArCUNMS19QRVJJUEgoQ0xLX01NVUFS
VDMsICJjbGtfcGVyaXBoX21tdWFydDMiLCBQQVJFTlRfQ0xLKEFIQiksIDgsIDApLA0KPiArCUNM
S19QRVJJUEgoQ0xLX01NVUFSVDQsICJjbGtfcGVyaXBoX21tdWFydDQiLCBQQVJFTlRfQ0xLKEFI
QiksIDksIDApLA0KPiArCUNMS19QRVJJUEgoQ0xLX1NQSTAsICJjbGtfcGVyaXBoX3NwaTAiLCBQ
QVJFTlRfQ0xLKEFIQiksIDEwLCAwKSwNCj4gKwlDTEtfUEVSSVBIKENMS19TUEkxLCAiY2xrX3Bl
cmlwaF9zcGkxIiwgUEFSRU5UX0NMSyhBSEIpLCAxMSwgMCksDQo+ICsJQ0xLX1BFUklQSChDTEtf
STJDMCwgImNsa19wZXJpcGhfaTJjMCIsIFBBUkVOVF9DTEsoQUhCKSwgMTIsIDApLA0KPiArCUNM
S19QRVJJUEgoQ0xLX0kyQzEsICJjbGtfcGVyaXBoX2kyYzEiLCBQQVJFTlRfQ0xLKEFIQiksIDEz
LCAwKSwNCj4gKwlDTEtfUEVSSVBIKENMS19DQU4wLCAiY2xrX3BlcmlwaF9jYW4wIiwgUEFSRU5U
X0NMSyhBSEIpLCAxNCwgMCksDQo+ICsJQ0xLX1BFUklQSChDTEtfQ0FOMSwgImNsa19wZXJpcGhf
Y2FuMSIsIFBBUkVOVF9DTEsoQUhCKSwgMTUsIDApLA0KPiArCUNMS19QRVJJUEgoQ0xLX1VTQiwg
ImNsa19wZXJpcGhfdXNiIiwgUEFSRU5UX0NMSyhBSEIpLCAxNiwgMCksDQo+ICsJQ0xLX1BFUklQ
SChDTEtfUlRDLCAiY2xrX3BlcmlwaF9ydGMiLCBQQVJFTlRfQ0xLKEFIQiksIDE4LCAwKSwNCj4g
KwlDTEtfUEVSSVBIKENMS19RU1BJLCAiY2xrX3BlcmlwaF9xc3BpIiwgUEFSRU5UX0NMSyhBSEIp
LCAxOSwgMCksDQo+ICsJQ0xLX1BFUklQSChDTEtfR1BJTzAsICJjbGtfcGVyaXBoX2dwaW8wIiwg
UEFSRU5UX0NMSyhBSEIpLCAyMCwgMCksDQo+ICsJQ0xLX1BFUklQSChDTEtfR1BJTzEsICJjbGtf
cGVyaXBoX2dwaW8xIiwgUEFSRU5UX0NMSyhBSEIpLCAyMSwgMCksDQo+ICsJQ0xLX1BFUklQSChD
TEtfR1BJTzIsICJjbGtfcGVyaXBoX2dwaW8yIiwgUEFSRU5UX0NMSyhBSEIpLCAyMiwgMCksDQo+
ICsJQ0xLX1BFUklQSChDTEtfRERSQywgImNsa19wZXJpcGhfZGRyYyIsIFBBUkVOVF9DTEsoQUhC
KSwgMjMsIENMS19JU19DUklUSUNBTCksDQo+ICsJQ0xLX1BFUklQSChDTEtfRklDMCwgImNsa19w
ZXJpcGhfZmljMCIsIFBBUkVOVF9DTEsoQUhCKSwgMjQsIENMS19JU19DUklUSUNBTCksDQo+ICsJ
Q0xLX1BFUklQSChDTEtfRklDMSwgImNsa19wZXJpcGhfZmljMSIsIFBBUkVOVF9DTEsoQUhCKSwg
MjUsIENMS19JU19DUklUSUNBTCksDQo+ICsJQ0xLX1BFUklQSChDTEtfRklDMiwgImNsa19wZXJp
cGhfZmljMiIsIFBBUkVOVF9DTEsoQUhCKSwgMjYsIENMS19JU19DUklUSUNBTCksDQo+ICsJQ0xL
X1BFUklQSChDTEtfRklDMywgImNsa19wZXJpcGhfZmljMyIsIFBBUkVOVF9DTEsoQUhCKSwgMjcs
IENMS19JU19DUklUSUNBTCksDQo+ICsJQ0xLX1BFUklQSChDTEtfQVRIRU5BLCAiY2xrX3Blcmlw
aF9hdGhlbmEiLCBQQVJFTlRfQ0xLKEFIQiksIDI4LCAwKSwNCj4gKwlDTEtfUEVSSVBIKENMS19D
Rk0sICJjbGtfcGVyaXBoX2NmbSIsIFBBUkVOVF9DTEsoQUhCKSwgMjksIDApLA0KPiArfTsNCj4g
Kw0KPiArc3RhdGljIGludCBtcGZzX2Nsa19yZWdpc3Rlcl9wZXJpcGgoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgbXBmc19wZXJpcGhfaHdfY2xvY2sgKnBlcmlwaF9odywNCj4gKwkJCQkgICAg
dm9pZCBfX2lvbWVtICpzeXNfYmFzZSkNCj4gK3sNCj4gKwlwZXJpcGhfaHctPnN5c19iYXNlID0g
c3lzX2Jhc2U7DQo+ICsNCj4gKwlyZXR1cm4gZGV2bV9jbGtfaHdfcmVnaXN0ZXIoZGV2LCAmcGVy
aXBoX2h3LT5odyk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgbXBmc19jbGtfcmVnaXN0ZXJf
cGVyaXBocyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtcGZzX3BlcmlwaF9od19jbG9jayAq
cGVyaXBoX2h3cywNCj4gKwkJCQkgICAgIGludCBudW1fY2xrcywgc3RydWN0IG1wZnNfY2xvY2tf
ZGF0YSAqZGF0YSkNCj4gK3sNCj4gKwl2b2lkIF9faW9tZW0gKnN5c19iYXNlID0gZGF0YS0+YmFz
ZTsNCj4gKwl1bnNpZ25lZCBpbnQgaSwgaWQ7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWZvciAo
aSA9IDA7IGkgPCBudW1fY2xrczsgaSsrKSB7DQo+ICsJCXN0cnVjdCBtcGZzX3BlcmlwaF9od19j
bG9jayAqcGVyaXBoX2h3ID0gJnBlcmlwaF9od3NbaV07DQo+ICsNCj4gKwkJcmV0ID0gbXBmc19j
bGtfcmVnaXN0ZXJfcGVyaXBoKGRldiwgcGVyaXBoX2h3LCBzeXNfYmFzZSk7DQo+ICsJCWlmIChy
ZXQpDQo+ICsJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byByZWdp
c3RlciBjbG9jayBpZDogJWRcbiIsDQo+ICsJCQkJCSAgICAgcGVyaXBoX2h3LT5wZXJpcGguaWQp
Ow0KPiArDQo+ICsJCWlkID0gcGVyaXBoX2h3c1tpXS5wZXJpcGguaWQ7DQo+ICsJCWRhdGEtPmh3
X2RhdGEuaHdzW2lkXSA9ICZwZXJpcGhfaHctPmh3Ow0KPiArCX0NCj4gKw0KPiArCXJldHVybiAw
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IG1wZnNfY2xrX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsNCj4gKwlzdHJ1Y3QgbXBmc19jbG9ja19kYXRhICpjbGtfZGF0YTsNCj4gKwl1bnNpZ25lZCBp
bnQgbnVtX2Nsa3M7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCS8qIENMS19SRVNFUlZFRCBpcyBu
b3QgcGFydCBvZiBjZmdfY2xrcyBub3IgcGVyaXBoX2Nsa3MsIHNvIGFkZCAxICovDQo+ICsJbnVt
X2Nsa3MgPSBBUlJBWV9TSVpFKG1wZnNfY2ZnX2Nsa3MpICsgQVJSQVlfU0laRShtcGZzX3Blcmlw
aF9jbGtzKSArIDE7DQo+ICsNCj4gKwljbGtfZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHN0cnVj
dF9zaXplKGNsa19kYXRhLCBod19kYXRhLmh3cywgbnVtX2Nsa3MpLCBHRlBfS0VSTkVMKTsNCj4g
KwlpZiAoIWNsa19kYXRhKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCWNsa19kYXRh
LT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiArCWlm
IChJU19FUlIoY2xrX2RhdGEtPmJhc2UpKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihjbGtfZGF0YS0+
YmFzZSk7DQo+ICsNCj4gKwljbGtfZGF0YS0+aHdfZGF0YS5udW0gPSBudW1fY2xrczsNCj4gKw0K
PiArCXJldCA9IG1wZnNfY2xrX3JlZ2lzdGVyX2NmZ3MoZGV2LCBtcGZzX2NmZ19jbGtzLCBBUlJB
WV9TSVpFKG1wZnNfY2ZnX2Nsa3MpLCBjbGtfZGF0YSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0
dXJuIHJldDsNCj4gKw0KPiArCXJldCA9IG1wZnNfY2xrX3JlZ2lzdGVyX3BlcmlwaHMoZGV2LCBt
cGZzX3BlcmlwaF9jbGtzLCBBUlJBWV9TSVpFKG1wZnNfcGVyaXBoX2Nsa3MpLA0KPiArCQkJCQlj
bGtfZGF0YSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldCA9
IGRldm1fb2ZfY2xrX2FkZF9od19wcm92aWRlcihkZXYsIG9mX2Nsa19od19vbmVjZWxsX2dldCwg
JmNsa19kYXRhLT5od19kYXRhKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiAr
DQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgbXBmc19jbGtfb2ZfbWF0Y2hfdGFibGVbXSA9IHsNCj4gKwl7IC5jb21wYXRpYmxl
ID0gIm1pY3JvY2hpcCxtcGZzLWNsa2NmZyIsIH0sDQo+ICsJe30NCj4gK307DQo+ICtNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBtcGZzX2Nsa19tYXRjaF90YWJsZSk7DQo+ICsNCj4gK3N0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1wZnNfY2xrX2RyaXZlciA9IHsNCj4gKwkucHJvYmUgPSBt
cGZzX2Nsa19wcm9iZSwNCj4gKwkuZHJpdmVyCT0gew0KPiArCQkubmFtZSA9ICJtaWNyb2NoaXAt
bXBmcy1jbGtjZmciLA0KPiArCQkub2ZfbWF0Y2hfdGFibGUgPSBtcGZzX2Nsa19vZl9tYXRjaF90
YWJsZSwNCj4gKwl9LA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGludCBfX2luaXQgY2xrX21wZnNf
aW5pdCh2b2lkKQ0KPiArew0KPiArCXJldHVybiBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJm1w
ZnNfY2xrX2RyaXZlcik7DQo+ICt9DQo+ICtjb3JlX2luaXRjYWxsKGNsa19tcGZzX2luaXQpOw0K
PiArDQo+ICtzdGF0aWMgdm9pZCBfX2V4aXQgY2xrX21wZnNfZXhpdCh2b2lkKQ0KPiArew0KPiAr
CXBsYXRmb3JtX2RyaXZlcl91bnJlZ2lzdGVyKCZtcGZzX2Nsa19kcml2ZXIpOw0KPiArfQ0KPiAr
bW9kdWxlX2V4aXQoY2xrX21wZnNfZXhpdCk7DQo+ICsNCj4gK01PRFVMRV9ERVNDUklQVElPTigi
TWljcm9jaGlwIFBvbGFyRmlyZSBTb0MgQ2xvY2sgRHJpdmVyIik7DQo+ICtNT0RVTEVfTElDRU5T
RSgiR1BMIHYyIik7DQoNCg==
