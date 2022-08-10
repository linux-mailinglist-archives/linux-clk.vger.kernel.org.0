Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A083358F34A
	for <lists+linux-clk@lfdr.de>; Wed, 10 Aug 2022 21:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbiHJTnr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 10 Aug 2022 15:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiHJTnq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Aug 2022 15:43:46 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E677AC17;
        Wed, 10 Aug 2022 12:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660160626; x=1691696626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kc6E5/pmsaVoK6OX+RyG1rzQITapgiydWjP+gvVIjiE=;
  b=L/o+0ntkSUoIb0ZNOUJXVkHqUniSMKCbedxV8FWzWa+ZblD4Bmj3Q9y+
   VhXITg04cCDODm8KwqoEoTMP8Pc9P+EhWu2X6AGMzFy8FuHsfAbUhXCuK
   9FKFygKjdNa5K3d0I3tXQErsX40rQzoBq17KNtPS55yDCCE/SHUOkbHtE
   IXskpVZws74CjKIUknhBclWZUC8BgL2yiHgGKZEmrxZNCFCG70SglYcyn
   CBA2Ek2uWU3lCQvQ6BIXGExcKg2gmkGgDwNxHQQA2npn4s4FHrNAf7CuT
   YtdOp4VcbwHZLHaAn74XanLanHayT4lBUt28sFGFjCOhMMr3SLx67/+3O
   w==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="175745557"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 12:43:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 12:43:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 12:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UChzfZQAuzp+P42Hm33lD4TaVby0eBM7gPEiYD5Yrc1eogcdRxdUA17V0PDLQ7MWP4lq+w6DSrEmg/T0TEagQvJ5zLLnauPOIx3BAKSrLQ1SQFOHWbJK5jH7X16RH0JqQQ1AsaToraWsuP44GfWNa09hV2eyvzBCBs39eZqis5meSsN+zbeJV9xJhoTdp2XBtDFxP//mG92+tkEc8dvka2Bvd5SZ4fl5m+1nnjf3UrFnevO77aeU6u1OoUtJHOHK9kHbec6w1g7yE4ia6KT5fW2MNUuoz+tgjcD4x9riSzbKpTv7AWVJjnp/3kEJtVFCA2mVin1UyP/CTMlT2xWxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc6E5/pmsaVoK6OX+RyG1rzQITapgiydWjP+gvVIjiE=;
 b=ia4pu3Dci70lH9qHxsYk9fTFQProLgYrgTX4nGgVnKU4qZQZIRWNBIiz/qhCPM5AnYo3wUnqkj7mVuW2yusxHB8NJyDFtBOjCGulDqfHOsHdZcIToUPBNbJulwq6s3skXaZBlTTLX3UeHVN/WaL3pGz/aiju35ynobziDu/BoynNSEkYc8O5u1iXWQ0rVijeium2prWyOnspwCpXdx4IipWHlHVr78DFBz+gffw3i4guHOpe1dFm4wIfIpebwHGMHA2/O1lm3/7FpHrLLmBvL7CoT0LdgQfqSzgkAQNm6TlkfG2bHtT6vyrG2/RSbytL5ooGKAWe6t1G33dzYBOx/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc6E5/pmsaVoK6OX+RyG1rzQITapgiydWjP+gvVIjiE=;
 b=GqW0DbgT+IJl1hBr3evJvhC/QK/+AuhnccSsfkB3a6crDDng2vg1TimeAzi3eJrgF4vW6Pgd6aGlc1v3r+//yO8LqLxrB5+MLM3eJXShYtFDxjMKOwUg36AbppPMZ7y81bjN0cDVk059ddwNOfVf05yBCTW+SlED5r4f78qldP4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1609.namprd11.prod.outlook.com (2603:10b6:4:8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Wed, 10 Aug 2022 19:43:38 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Wed, 10 Aug 2022
 19:43:38 +0000
From:   <Conor.Dooley@microchip.com>
To:     <nathan@kernel.org>, <Conor.Dooley@microchip.com>
CC:     <ndesaulniers@google.com>, <llvm@lists.linux.dev>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <Daire.McNamara@microchip.com>,
        <palmer@dabbelt.com>
Subject: Re: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Topic: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Index: AQHYj5/vIrxOVV1EL0SoHOsgiQHkyK2nacwAgAFM1ACAAAaZgIAAA0QAgAADOwA=
Date:   Wed, 10 Aug 2022 19:43:38 +0000
Message-ID: <3d2c56fa-8245-4992-2074-cd39677c2b3f@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
 <bd14f1a2-750d-2511-df0a-85a9f5925f84@microchip.com>
 <YvP/bjh+wXihlrdG@dev-arch.thelio-3990X>
 <fc470bf4-33bb-d67b-3860-3ac775982f27@microchip.com>
 <YvQHtGObJwyBKGCQ@dev-arch.thelio-3990X>
In-Reply-To: <YvQHtGObJwyBKGCQ@dev-arch.thelio-3990X>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93cb06ad-cbb4-490b-4fb5-08da7b089f2f
x-ms-traffictypediagnostic: DM5PR11MB1609:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V2zcgCU8pVkW+rnXigbDSd3vLF+RfX8uNpPtHmh6VlEPPcA85l6Njt3EsViVediZqkIWobqonM5rExsKfXm6R7uqIkDeoGoHPCAv12CubwXfqWBho90dGgCy3B55CwxHzFIYmQnN9oDOtt7dOlDA4g73VAarX7W5m9aWOZb20mZj3xJIeLjfZecYpYVSo6Mlsxr+yl+qUloRBWO9tcL5KwAgAiGOP2t69/WHlHwXubAMoQTywdldXsgnc+odybJ9b3k96JbSNs3ftLlwADlONanDWLW11UnoEdbJYTR9bmYeycar4q3YpP/feODqcvEP5W8s/yo5uzWV67gRMW3VGL8AemxvIV/fSFbNUSsnxg0tEk5LqV1JHXcYS/JXL88KrDPrsOpWr4gw2ictFdThrDrU8mLQb2JJ8Dc1TSZROBz6rxx0QuR0mcx+IvAY2OLYt0WnTtASysZnxsmxhrSVxwcfV0axkui+ZgaejKuEaf7ZQPrIcARRRF1GTwN8/MrLaLd79KFLBWitLo4I7pZAhE3zRtkf419YVzvDahDJ7SPUwqezhhnIPGusDNR+K1euJBqsBYFVWq8zgvkxDkoPiBuFvwqV37WfFNbbb+7+Rt7Ecg4uEDeHhp4iMyn1+Ei76LQ7shhtGzLhFE9pgd9jGbSd5ZiwDNSdGVIcek0LnXgXRsuPccnnql7JUcP9iQGNYW/ECaKNZL59XzS/eTHjiVza95/lE07NGgsU7AmdX2iLn9i6DtuUgJ+H8xQfzMUAltdzetXsw3vgehRZAc2pnV9UKGZMNe3E7WDwTI48LgT6X+t1gFRwrsuxQMqvw75W5mm7VHpSiI2qFjX/wnALxvFXy29CE6TrtB3dRP7xhiKFn8BR/ZQuwKVBRu8YlokwQoWSBNqISjmfBOCGl0vr5zPcAHNJ6bXTNrI6wZBijM+YvNjRj9NoXVuAf2g1kSgM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(83380400001)(38070700005)(2616005)(186003)(91956017)(4326008)(8676002)(66556008)(66476007)(30864003)(66446008)(316002)(64756008)(5660300002)(76116006)(36756003)(54906003)(66946007)(8936002)(7416002)(110136005)(31686004)(53546011)(6512007)(6506007)(86362001)(6486002)(478600001)(26005)(41300700001)(966005)(71200400001)(2906002)(31696002)(38100700002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjY2Q2NianU1NU1JRTU5MG01U3ZWaWpTRDlUSGFHRFVMdkVJQVRxeVJSZWY2?=
 =?utf-8?B?cUp6UW9jRU8wMkxzSGs4Vi9wb0tMaVgxb291cStheEp6aUJZL0Y0bkk5aVcr?=
 =?utf-8?B?MnBaM0RBaVFzNE5OTGNnVnZOSlYwdnpkVkNEcVFwZWJUd1d0K3BHc0JTK1di?=
 =?utf-8?B?QjJhM0lVb2JhK2t0Y3dzVzEwY3JpZW1hQ2YvRjFweEJ3dkZzV0lBS0xIQkxz?=
 =?utf-8?B?WkRLOUFWaGhPM0tQeHBBbWdrWElSS01Yang2d0FGbjM3OUVlaUVsMnh6WVhJ?=
 =?utf-8?B?VGxQUUR4Y0JiUTVSOEtmQkJ5TnFMMkp5ZitzWGNNNDhhYi9wTkpEM28ydXBU?=
 =?utf-8?B?MnVmNjZPUHlzd2g3YkFxRFpadWJoaTJEVlU0aFFKVzB0RStGWmZ4Ym94UmVJ?=
 =?utf-8?B?aU1oSnBSalkvV1NJSHRXcHkrUnoyZ3c1cWFBTVpzZHVUMHhLOVpHNXZPVDVi?=
 =?utf-8?B?d1BkR0tPRjUveFRLaU1zRm1QV2RlazNMRnAwc1FXbFVFL2dHeis0S3d3bzVl?=
 =?utf-8?B?SVhkTVNqSjh4bEVEVkcwaVREVy9Zcnd6bjVOWDZxaGx5Wm1Fb0wvelV5MUx6?=
 =?utf-8?B?aUs1WWRKWGlvQUxIb0dXeS9lUHA2bElnUnlIQmxrNy83aXg2WXNCUy9MaU51?=
 =?utf-8?B?N2NEcmlDK2t2WHptVHhxemwzd016UU9sU3krbU5YWW5GMTVEazRoTHE4Vk5q?=
 =?utf-8?B?dC9xUXk1aXozS3RqQnlhcVMvblU2VTJBVWVjeEs3VlFWcTMxVkdNLzNiL05l?=
 =?utf-8?B?MUFPOEJMUFNDaDJXdEFMNnZYdGtaeXNYTVQ2bTFMVFRYNWpJK1NXdXNpYTlO?=
 =?utf-8?B?Y0xyeUozVlVMV2d4QVFwOXAxSytJSWl2NUk1L3Ixek9MbGl4WVZJYzAzQkdy?=
 =?utf-8?B?RlNYb3Qwd0Z1Q0NhYVRKaDZMQWdoWTJGR1lzRFFqMnRVbHpaUDNlcWhZYVZh?=
 =?utf-8?B?L2hoMHRGQnd4ZXFhRTdxaUc2TzJzcGdKYlRnc1puWFBneVFnd2hob3RaaU5o?=
 =?utf-8?B?QzZ0aHAzS3VsVUlaSGozb2NUeW1kSWtKM1hsVjMwdjZBckhNNXYrR2Q0UEVM?=
 =?utf-8?B?Z3phMCtrb2VYWjgvQTdCam9WUDFDb2g2TVYyNHh1Z1Fra2N3bUhQZm9DUXI2?=
 =?utf-8?B?VktvTnp3WFFpWkY1T2Zxa2lKWC9nd0l2S1l6YzNDVjNFb0hIZEtFNk5PMW9k?=
 =?utf-8?B?TGpkanF3NDhCSFEwVUQweEZYVEhPUjhydTVXL2lOYzdKR0NBMGZoYjNDZkJp?=
 =?utf-8?B?VmdJM2NucXZSRXd6ZnB0QmF1Z2NiT1c4ZkREMHdZZkxHMTJjbndlZ2ExK2xy?=
 =?utf-8?B?YmtSMDkrd1E1OVAzMzFvS1RuczNrSHB1YmFUSnl6SDNmMFhaRUYxUnBnaU9L?=
 =?utf-8?B?eDlrQ3dteGsydllLdnpEVW1EREduaUZyd3RZV2NXRlpRNFZoaVAxSXVXR0lV?=
 =?utf-8?B?SkIxMVRCSWppbzZsZWNJaHJ6OVpDOHFPWHdZVmdrVDZzUk5TYnRYZ25LdmlN?=
 =?utf-8?B?MEdlWW1kLzM4dGRWbTRuTFQ3OWhCcUJ1c0xMVklPWndGYmNOb3ExUld5b0RX?=
 =?utf-8?B?cGVGdk9jcnVUTDJlNzhVbFZyVHJnNmx3azNrQ09RSS93aFVJa3M1cmpRRlRV?=
 =?utf-8?B?YjdEaE9HQU05OFlQZUF3VkFBVDh0RE9mU1dBZkVac01xNHM5R2hDSVI4OU5w?=
 =?utf-8?B?L3Zyd1I1RlBTRXRGSVFrSjg3SGM4azRvSEM2OWZjeGtuZFRxZDlCNVFJNURi?=
 =?utf-8?B?aVgvM2VSL29ZZ0hoYTBEMXc0S1FoU2FwRW5MbDNMb1ZmY3oyc0dCSG9idHV6?=
 =?utf-8?B?c1l0dWNUZmpoMUJ6NTVueXpkVThnbTlDWWg2NmhscDZvejdIQzE0Q2lDcmIw?=
 =?utf-8?B?bDJLM1lKaWIrL3JmbXdBdFNZeGtOUFB2R2g4ZDNmZ0FGTE9scVFRL1JhK2E0?=
 =?utf-8?B?VjdLZ05oZVRNMkdPL2doUUMyV3o1YWZiWlA1aUVtNUV4NFAzOFcxOEpwdC83?=
 =?utf-8?B?dXhCSkhoV1QwQkNCVkpqRCszTVRMWHFWSHNXVThvMkdLbXJ4QlRaQWFUbCt3?=
 =?utf-8?B?NjJxTzdXQnk3YjJlMExEZDRLOURORUk2b3kyTjNDMS92MDJIaVdqZWtvQmlT?=
 =?utf-8?Q?cDZILvQFs+cLLWe+XaXmZkL8w?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC2EB196A10BF948902E3985F38A001B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cb06ad-cbb4-490b-4fb5-08da7b089f2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 19:43:38.6666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: km7FpCVWm0JJa2CuLvyBvV8z6XmDLPBXH/syxc5nhPc1tvU4Eulz/DWJWUnE5IEN+jo7O5JdGMOjl8ZTjNgmRx1BAr1VDzocV9mBl9C0Spo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1609
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMTAvMDgvMjAyMiAyMDozMiwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6DQo+IE9uIFdlZCwg
QXVnIDEwLCAyMDIyIGF0IDA3OjIwOjI0UE0gKzAwMDAsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAu
Y29tIHdyb3RlOg0KPj4gT24gMTAvMDgvMjAyMiAxOTo1NiwgTmF0aGFuIENoYW5jZWxsb3Igd3Jv
dGU6DQo+Pj4gSGkgQ29ub3IsDQo+Pj4NCj4+PiBPbiBUdWUsIEF1ZyAwOSwgMjAyMiBhdCAxMTow
NTozMlBNICswMDAwLCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gK0ND
IGNsYW5nIHBlb3BsZSA6KQ0KPj4+Pg0KPj4+PiBHb3QgYW4gb2RkIG9uZSBoZXJlIGFuZCB3b3Vs
ZCBhcHByZWNpYXRlIHNvbWUgcG9pbnRlcnMgZm9yIHdoZXJlIHRvDQo+Pj4+IGxvb2suIFRoaXMg
Y29kZSB3aGVuIGJ1aWx0IHdpdGggZ2NjIGJvb3RzIGZpbmUsIGZvciBleGFtcGxlIHdpdGg6DQo+
Pj4+IHJpc2N2NjQtdW5rbm93bi1saW51eC1nbnUtZ2NjIChnNTk2NGI1Y2Q3MjcpIDExLjEuMA0K
Pj4+PiBUaGUgc2FtZSBjb2RlIGJ1dCBidWlsZCB3aXRoIGNsYW5nIGJ1aWxkIGl0IGZhaWxzIHRv
IGJvb3QgYnV0IHByaW9yIHRvDQo+Pj4+IHRoYXQgYXBwbHlpbmcgdGhpcyBwYXRjaHNldCBpdCBi
b290cyBmaW5lLiBTcGVjaWZpY2FsbHkgaXQgaXMgdGhlIHBhdGNoDQo+Pj4+ICJjbGs6IG1pY3Jv
Y2hpcDogbXBmczogbW92ZSBpZCAmIG9mZnNldCBvdXQgb2YgY2xvY2sgc3RydWN0cyINCj4+Pj4N
Cj4+Pj4gSSBhcHBsaWVkIHRoaXMgcGF0Y2hzZXQgb24gdG9wIG9mIHRvbmlnaHQncyBtYXN0ZXIg
KDE1MjA1YzI4MjljYSkgYnV0DQo+Pj4+IEkndmUgYmVlbiBzZWVpbmcgdGhlIHNhbWUgcHJvYmxl
bSBmb3IgYSBmZXcgd2Vla3Mgb24gLW5leHQgdG9vLiBJIHRyaWVkDQo+Pj4+IHRoZSBmb2xsb3dp
bmcgMiB2ZXJzaW9ucyBvZiBjbGFuZy9sbHZtOg0KPj4+PiBDbGFuZ0J1aWx0TGludXggY2xhbmcg
dmVyc2lvbiAxNS4wLjAgKDViMDc4OGZlZjg2ZWQ3MDA4YTExZjZlZTE5YjlkODZkNDJiNmZjZmEp
LCBMTEQgMTUuMC4wDQo+Pj4+IENsYW5nQnVpbHRMaW51eCBjbGFuZyB2ZXJzaW9uIDE1LjAuMCAo
YmFiOGFmOGVhMDYyZjYzMzJiNWM1ZDEzYWU2ODhiYjg5MDBmMjQ0YSksIExMRCAxNS4wLjANCj4+
Pg0KPj4+IEdvb2QgdG8ga25vdyB0aGF0IGl0IHJlcHJvZHVjZXMgd2l0aCBmYWlybHkgcmVjZW50
IHZlcnNpb25zIG9mIExMVk0gOikNCj4+Pg0KPj4+PiBJdCdzIHByb2JhYmx5IHNvbWV0aGluZyBz
aWxseSB0aGF0IEkndmUgb3Zlcmxvb2tlZCBidXQgSSBhbSBub3QgYXUNCj4+Pj4gZmFpdCB3aXRo
IHRoZXNlIHNvcnQgb2YgdGhpbmdzIHVuZm9ydHVuYXRlbHksIGJ1dCBoZXkgLSBhdCBsZWFzdCBJ
J2xsDQo+Pj4+IGxlYXJuIHNvbWV0aGluZyB0aGVuLg0KPj4+DQo+Pj4gSSB0b29rIGEgcXVpY2sg
Z2xhbmNlIGF0IHRoZSBwYXRjaCB5b3UgbWVudGlvbmVkIGFib3ZlIGFuZCBJIGRvbid0DQo+Pj4g
aW1tZWRpYXRlbHkgc2VlIGFueXRoaW5nIGFzIHByb2JsZW1hdGljLi4uDQo+Pg0KPj4gWWVhaCwg
SSBjb3VsZG4ndCBzZWUgYW55IGxvdyBoYW5naW5nIGZydWl0IGVpdGhlci4NCj4+DQo+Pj4gSSB3
YXMgZ29pbmcgdG8gc2VlIGlmIEkgY291bGQNCj4+PiByZXByb2R1Y2UgdGhpcyBsb2NhbGx5IGlu
IFFFTVUgc2luY2UgSSBkbyBzZWUgdGhlcmUgaXMgYSBtYWNoaW5lDQo+Pj4gJ21pY3JvY2hpcC1p
Y2ljbGUta2l0JyBidXQgSSBhbSBub3QgaGF2aW5nIG11Y2ggc3VjY2VzcyBnZXR0aW5nIHRoZQ0K
Pj4+IG1hY2hpbmUgcGFzdCBTQkkuIERvZXMgdGhpcyByZXByb2R1Y2UgaW4gUUVNVSBvciBhcmUg
eW91IHdvcmtpbmcgd2l0aA0KPj4+IHRoZSByZWFsIGhhcmR3YXJlPyBJZiBRRU1VLCBkbyB5b3Ug
aGFwcGVuIHRvIGhhdmUgYSB3b3JraW5nIGludm9jYXRpb24NCj4+PiBoYW5keT8NCj4+DQo+PiBZ
ZWFoLi4uIFNvIHRoZXJlIHdhcyBhIFFFTVUgaW5jYW50YXRpb24gdGhhdCB3b3JrZWQgYXQgc29t
ZSBwb2ludCBpbg0KPj4gdGhlIHBhc3QgKGllIHdoZW4gc29tZW9uZSB3cm90ZSB0aGUgUUVNVSBw
b3J0KSBidXQgbW9zdCBwZXJpcGhlcmFscw0KPj4gYXJlIG5vdCBpbXBsZW1lbnRlZCBhbmQgY3Vy
cmVudCB2ZXJzaW9ucyBvZiBvdXIgb3BlblNCSSBpbXBsZW1lbnRhdGlvbg0KPj4gcmVxdWlyZXMg
bW9yZSB0aGFuIG9uZSBvZiB0aGUgdW5pbXBsZW1lbnRlZCBwZXJpcGhlcmFscy4gSSB3YXMgdHJ5
aW5nIHRvDQo+PiBnZXQgaXQgd29ya2luZyBsYXRlbHkgaW4gdGhlIGV2ZW5pbmdzIGJhc2VkIG9u
IHNvbWUgcGF0Y2hlcyB0aGF0IHdlcmUgYQ0KPj4geWVhciBvbGQgYnV0IG5vIGpveSA6Lw0KPiAN
Cj4gSGVoLCBJIGd1ZXNzIHRoYXQgd291bGQgZXhwbGFpbiB3aHkgaXQgd2Fzbid0IHdvcmtpbmcg
Zm9yIG1lIDopDQo+IA0KPj4gSSdtIHJ1bm5pbmcgb24gdGhlIHJlYWwgaGFyZHdhcmUsIEknbGwg
Z2l2ZSB0aGUgb2xkZXIgY29tYm8gb2YgcWVtdQ0KPj4gImJpb3MiIGV0YyBhIGdvIGFnYWluIG92
ZXIgdGhlIHdlZWtlbmQgJiB0cnkgdG8gZ2V0IGl0IHdvcmtpbmcuIEluIHRoZQ0KPj4gbWVhbnRp
bWUsIGFueSBzdWdnZXN0aW9ucz8NCj4gDQo+IEFyZSB5b3UgYnVpbGRpbmcgd2l0aCAnTExWTT0x
JyBvciBqdXN0ICdDQz1jbGFuZyc/IElmICdMTFZNPTEnLCBJIHdvdWxkDQo+IHRyeSBicmVha2lu
ZyBpdCBhcGFydCBpbnRvIHRoZSBpbmRpdmlkdWFsIG9wdGlvbnMgKExEPWxkLmxsZCwNCj4gT0JK
Q09QWT1sbHZtLW9iamNvcHkpIGFuZCBzZWUgaWYgZHJvcHBpbmcgb25lIG9mIHRob3NlIG1ha2Vz
IGENCj4gZGlmZmVyZW5jZS4gV2UgaGF2ZSBoYWQgc3VidGxlIGRpZmZlcmVuY2VzIGJldHdlZW4g
dGhlIEdOVSBhbmQgTExWTQ0KPiB0b29scyBiZWZvcmUgYW5kIGl0IGlzIG11Y2ggZWFzaWVyIHRv
IGxvb2sgaW50byB0aGF0IGRpZmZlcmVuY2UgaWYgd2UNCj4ga25vdyBpdCBoYXBwZW5zIGluIG9u
bHkgb25lIHRvb2wuDQoNCkxMVk09MS4NCg0KPiANCj4gT3RoZXJ3aXNlLCBJIGFtIG5vdCBzdXJl
IEkgaGF2ZSBhbnkgaW1tZWRpYXRlIGlkZWFzIG90aGVyIHRoYW4gbG9va2luZw0KPiBhdCB0aGUg
ZGlzYXNzZW1ibHkgYW5kIHRyeWluZyB0byBzZWUgaWYgc29tZXRoaW5nIGlzIGdvaW5nIHdyb25n
LiBJcw0KPiB0aGUgb2JqZWN0IGZpbGUgYmVpbmcgbW9kaWZpZWQgaW4gYW55IG90aGVyIHdheSAo
SSBkb24ndCB0aGluayB0aGVyZSBpcw0KPiBzb21ldGhpbmcgbGlrZSBvYmp0b29sIGZvciBSSVND
LVYgYnV0IEkgY291bGQgYmUgd3JvbmcpPw0KDQpJJ2xsIGdpdmUgdGhlIG9wdGlvbnMgYSBnbyBz
bywgSSdsbCBMWUsgaG93IEkgZ2V0IG9uLg0KVGhhbmtzLA0KQ29ub3IuDQoNCj4gDQo+IENoZWVy
cywNCj4gTmF0aGFuDQo+IA0KPj4+PiBUaGUgYm9vdCBsb2cgaXMgZmFpcmx5IHNob3J0IHNvIGhl
cmUgeWEgZ286DQo+Pj4+DQo+Pj4+IFsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS4xOS4w
LTEzMjUzLWczNzRiNTA4ZWUzMTggKGNvbm9yQHNwdWQpIChDbGFuZ0J1aWx0TGludXggY2xhbmcg
dmVyc2lvbiAxNS4wLjAgKGdpdEBnDQo+Pj4+IGl0aHViLmNvbTpsbHZtL2xsdm0tcHJvamVjdC5n
aXQgNWIwNzg4ZmVmODZlZDcwMDhhMTFmNmVlMTliOWQ4NmQ0MmI2ZmNmYSksIExMRCAxNS4wLjAp
ICMxIFNNUCBUdWUgQXVnIDkgMjI6NDI6MTAgSVNUIA0KPj4+PiAyMDIyDQo+Pj4+IFsgICAgMC4w
MDAwMDBdIE9GOiBmZHQ6IElnbm9yaW5nIG1lbW9yeSByYW5nZSAweDgwMDAwMDAwIC0gMHg4MDIw
MDAwMA0KPj4+PiBbICAgIDAuMDAwMDAwXSBNYWNoaW5lIG1vZGVsOiBNaWNyb2NoaXAgUG9sYXJG
aXJlLVNvQyBJY2ljbGUgS2l0DQo+Pj4+IFsgICAgMC4wMDAwMDBdIGVhcmx5Y29uOiBuczE2NTUw
YTAgYXQgTU1JTzMyIDB4MDAwMDAwMDAyMDEwMDAwMCAob3B0aW9ucyAnMTE1MjAwbjgnKQ0KPj4+
PiBbICAgIDAuMDAwMDAwXSBwcmludGs6IGJvb3Rjb25zb2xlIFtuczE2NTUwYTBdIGVuYWJsZWQN
Cj4+Pj4gWyAgICAwLjAwMDAwMF0gZWZpOiBVRUZJIG5vdCBmb3VuZC4NCj4+Pj4gWyAgICAwLjAw
MDAwMF0gWm9uZSByYW5nZXM6DQo+Pj4+IFsgICAgMC4wMDAwMDBdICAgRE1BMzIgICAgW21lbSAw
eDAwMDAwMDAwODAyMDAwMDAtMHgwMDAwMDAwMGZmZmZmZmZmXQ0KPj4+PiBbICAgIDAuMDAwMDAw
XSAgIE5vcm1hbCAgIFttZW0gMHgwMDAwMDAwMTAwMDAwMDAwLTB4MDAwMDAwMTAzZmZmZmZmZl0N
Cj4+Pj4gWyAgICAwLjAwMDAwMF0gTW92YWJsZSB6b25lIHN0YXJ0IGZvciBlYWNoIG5vZGUNCj4+
Pj4gWyAgICAwLjAwMDAwMF0gRWFybHkgbWVtb3J5IG5vZGUgcmFuZ2VzDQo+Pj4+IFsgICAgMC4w
MDAwMDBdICAgbm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMDgwMjAwMDAwLTB4MDAwMDAwMDBhZGZm
ZmZmZl0NCj4+Pj4gWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDEwMDAw
MDAwMDAtMHgwMDAwMDAxMDNmZmZmZmZmXQ0KPj4+PiBbICAgIDAuMDAwMDAwXSBJbml0bWVtIHNl
dHVwIG5vZGUgMCBbbWVtIDB4MDAwMDAwMDA4MDIwMDAwMC0weDAwMDAwMDEwM2ZmZmZmZmZdDQo+
Pj4+IFsgICAgMC4wMDAwMDBdIE9uIG5vZGUgMCwgem9uZSBOb3JtYWw6IDE2MDY0NTEyIHBhZ2Vz
IGluIHVuYXZhaWxhYmxlIHJhbmdlcw0KPj4+PiBbICAgIDAuMDAwMDAwXSBTQkkgc3BlY2lmaWNh
dGlvbiB2MC4zIGRldGVjdGVkDQo+Pj4+IFsgICAgMC4wMDAwMDBdIFNCSSBpbXBsZW1lbnRhdGlv
biBJRD0weDEgVmVyc2lvbj0weDkNCj4+Pj4gWyAgICAwLjAwMDAwMF0gU0JJIFRJTUUgZXh0ZW5z
aW9uIGRldGVjdGVkDQo+Pj4+IFsgICAgMC4wMDAwMDBdIFNCSSBJUEkgZXh0ZW5zaW9uIGRldGVj
dGVkDQo+Pj4+IFsgICAgMC4wMDAwMDBdIFNCSSBSRkVOQ0UgZXh0ZW5zaW9uIGRldGVjdGVkDQo+
Pj4+IFsgICAgMC4wMDAwMDBdIFNCSSBIU00gZXh0ZW5zaW9uIGRldGVjdGVkDQo+Pj4+IFsgICAg
MC4wMDAwMDBdIENQVSB3aXRoIGhhcnRpZD0wIGlzIG5vdCBhdmFpbGFibGUNCj4+Pj4gWyAgICAw
LjAwMDAwMF0gQ1BVIHdpdGggaGFydGlkPTAgaXMgbm90IGF2YWlsYWJsZQ0KPj4+PiBbICAgIDAu
MDAwMDAwXSByaXNjdjogYmFzZSBJU0EgZXh0ZW5zaW9ucyBhY2RmaW0NCj4+Pj4gWyAgICAwLjAw
MDAwMF0gcmlzY3Y6IEVMRiBjYXBhYmlsaXRpZXMgYWNkZmltDQo+Pj4+IFsgICAgMC4wMDAwMDBd
IHBlcmNwdTogRW1iZWRkZWQgMTggcGFnZXMvY3B1IHMzNDE2OCByODE5MiBkMzEzNjggdTczNzI4
DQo+Pj4+IFsgICAgMC4wMDAwMDBdIHBjcHUtYWxsb2M6IHMzNDE2OCByODE5MiBkMzEzNjggdTcz
NzI4IGFsbG9jPTE4KjQwOTYNCj4+Pj4gWyAgICAwLjAwMDAwMF0gcGNwdS1hbGxvYzogWzBdIDAg
WzBdIDEgWzBdIDIgWzBdIDMNCj4+Pj4gWyAgICAwLjAwMDAwMF0gQ1BVIG5vZGUgZm9yIC9jcHVz
L2NwdUAwIGV4aXN0IGJ1dCB0aGUgcG9zc2libGUgY3B1IHJhbmdlIGlzIDowLTMNCj4+Pj4gWyAg
ICAwLjAwMDAwMF0gQnVpbHQgMSB6b25lbGlzdHMsIG1vYmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90
YWwgcGFnZXM6IDIyNDI2Mw0KPj4+PiBbICAgIDAuMDAwMDAwXSBLZXJuZWwgY29tbWFuZCBsaW5l
OiByb290PS9kZXYvbmZzIGlwPWRoY3AgZGVidWcgbmZzcm9vdD0xOTIuMTY4LjIuNTovc3R1ZmYv
bmZzX3NoYXJlIGVhcmx5Y29uDQo+Pj4+IFsgICAgMC4wMDAwMDBdIERlbnRyeSBjYWNoZSBoYXNo
IHRhYmxlIGVudHJpZXM6IDEzMTA3MiAob3JkZXI6IDgsIDEwNDg1NzYgYnl0ZXMsIGxpbmVhcikN
Cj4+Pj4gWyAgICAwLjAwMDAwMF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA2NTUz
NiAob3JkZXI6IDcsIDUyNDI4OCBieXRlcywgbGluZWFyKQ0KPj4+PiBbICAgIDAuMDAwMDAwXSBt
ZW0gYXV0by1pbml0OiBzdGFjazphbGwoemVybyksIGhlYXAgYWxsb2M6b2ZmLCBoZWFwIGZyZWU6
b2ZmDQo+Pj4+IFsgICAgMC4wMDAwMDBdIHNvZnR3YXJlIElPIFRMQjogYXJlYSBudW0gNC4NCj4+
Pj4gWyAgICAwLjAwMDAwMF0gc29mdHdhcmUgSU8gVExCOiBtYXBwZWQgW21lbSAweDAwMDAwMDAw
YWEwMDAwMDAtMHgwMDAwMDAwMGFlMDAwMDAwXSAoNjRNQikNCj4+Pj4gWyAgICAwLjAwMDAwMF0g
VmlydHVhbCBrZXJuZWwgbWVtb3J5IGxheW91dDoNCj4+Pj4gWyAgICAwLjAwMDAwMF0gICAgICAg
Zml4bWFwIDogMHhmZmZmZmZjNmZlZTAwMDAwIC0gMHhmZmZmZmZjNmZmMDAwMDAwICAgKDIwNDgg
a0IpDQo+Pj4+IFsgICAgMC4wMDAwMDBdICAgICAgIHBjaSBpbyA6IDB4ZmZmZmZmYzZmZjAwMDAw
MCAtIDB4ZmZmZmZmYzcwMDAwMDAwMCAgICggIDE2IE1CKQ0KPj4+PiBbICAgIDAuMDAwMDAwXSAg
ICAgIHZtZW1tYXAgOiAweGZmZmZmZmM3MDAwMDAwMDAgLSAweGZmZmZmZmM4MDAwMDAwMDAgICAo
NDA5NiBNQikNCj4+Pj4gWyAgICAwLjAwMDAwMF0gICAgICB2bWFsbG9jIDogMHhmZmZmZmZjODAw
MDAwMDAwIC0gMHhmZmZmZmZkODAwMDAwMDAwICAgKCAgNjQgR0IpDQo+Pj4+IFsgICAgMC4wMDAw
MDBdICAgICAgIGxvd21lbSA6IDB4ZmZmZmZmZDgwMDAwMDAwMCAtIDB4ZmZmZmZmZTdiZmUwMDAw
MCAgICggIDYyIEdCKQ0KPj4+PiBbICAgIDAuMDAwMDAwXSAgICAgICBrZXJuZWwgOiAweGZmZmZm
ZmZmODAwMDAwMDAgLSAweGZmZmZmZmZmZmZmZmZmZmYgICAoMjA0NyBNQikNCj4+Pj4gWyAgICAw
LjAwMDAwMF0gTWVtb3J5OiA4MDMwMzJLLzE4MDAxOTJLIGF2YWlsYWJsZSAoNzQ4NUsga2VybmVs
IGNvZGUsIDI4NThLIHJ3ZGF0YSwgNDA5Nksgcm9kYXRhLCAyMTgxSyBpbml0LCAzOTRLIGJzcywg
OTk3MTYwSyByZXNlcnZlZCwgMEsgY21hLXJlc2VydmVkKQ0KPj4+PiBbICAgIDAuMDAwMDAwXSBT
TFVCOiBIV2FsaWduPTY0LCBPcmRlcj0wLTMsIE1pbk9iamVjdHM9MCwgQ1BVcz00LCBOb2Rlcz0x
DQo+Pj4+IFsgICAgMC4wMDAwMDBdIHJjdTogSGllcmFyY2hpY2FsIFJDVSBpbXBsZW1lbnRhdGlv
bi4NCj4+Pj4gWyAgICAwLjAwMDAwMF0gcmN1OiAgICAgUkNVIHJlc3RyaWN0aW5nIENQVXMgZnJv
bSBOUl9DUFVTPTggdG8gbnJfY3B1X2lkcz00Lg0KPj4+PiBbICAgIDAuMDAwMDAwXSByY3U6ICAg
ICBSQ1UgZGVidWcgZXh0ZW5kZWQgUVMgZW50cnkvZXhpdC4NCj4+Pj4gWyAgICAwLjAwMDAwMF0g
IFRyYWNpbmcgdmFyaWFudCBvZiBUYXNrcyBSQ1UgZW5hYmxlZC4NCj4+Pj4gWyAgICAwLjAwMDAw
MF0gcmN1OiBSQ1UgY2FsY3VsYXRlZCB2YWx1ZSBvZiBzY2hlZHVsZXItZW5saXN0bWVudCBkZWxh
eSBpcyAyNSBqaWZmaWVzLg0KPj4+PiBbICAgIDAuMDAwMDAwXSByY3U6IEFkanVzdGluZyBnZW9t
ZXRyeSBmb3IgcmN1X2Zhbm91dF9sZWFmPTE2LCBucl9jcHVfaWRzPTQNCj4+Pj4gWyAgICAwLjAw
MDAwMF0gTlJfSVJRUzogNjQsIG5yX2lycXM6IDY0LCBwcmVhbGxvY2F0ZWQgaXJxczogMA0KPj4+
PiBbICAgIDAuMDAwMDAwXSBDUFUgd2l0aCBoYXJ0aWQ9MCBpcyBub3QgYXZhaWxhYmxlDQo+Pj4+
IFsgICAgMC4wMDAwMDBdIHJpc2N2LWludGM6IHVuYWJsZSB0byBmaW5kIGhhcnQgaWQgZm9yIC9j
cHVzL2NwdUAwL2ludGVycnVwdC1jb250cm9sbGVyDQo+Pj4+IFsgICAgMC4wMDAwMDBdIHJpc2N2
LWludGM6IDY0IGxvY2FsIGludGVycnVwdHMgbWFwcGVkDQo+Pj4+IFsgICAgMC4wMDAwMDBdIHBs
aWM6IGludGVycnVwdC1jb250cm9sbGVyQGMwMDAwMDA6IG1hcHBlZCAxODYgaW50ZXJydXB0cyB3
aXRoIDQgaGFuZGxlcnMgZm9yIDkgY29udGV4dHMuDQo+Pj4+IFsgICAgMC4wMDAwMDBdIHJjdTog
c3JjdV9pbml0OiBTZXR0aW5nIHNyY3Vfc3RydWN0IHNpemVzIGJhc2VkIG9uIGNvbnRlbnRpb24u
DQo+Pj4+IFsgICAgMC4wMDAwMDBdIHJpc2N2X3RpbWVyX2luaXRfZHQ6IFJlZ2lzdGVyaW5nIGNs
b2Nrc291cmNlIGNwdWlkIFswXSBoYXJ0aWQgWzRdDQo+Pj4+IFsgICAgMC4wMDAwMDBdIGNsb2Nr
c291cmNlOiByaXNjdl9jbG9ja3NvdXJjZTogbWFzazogMHhmZmZmZmZmZmZmZmZmZmZmIG1heF9j
eWNsZXM6IDB4MWQ4NTRkZjQwLCBtYXhfaWRsZV9uczogMzUyNjM2MTYxNjk2MCBucw0KPj4+PiBb
ICAgIDAuMDAwMDAzXSBzY2hlZF9jbG9jazogNjQgYml0cyBhdCAxMDAwa0h6LCByZXNvbHV0aW9u
IDEwMDBucywgd3JhcHMgZXZlcnkgMjE5OTAyMzI1NTUwMG5zDQo+Pj4+IFsgICAgMC4wMDk3MTNd
IENvbnNvbGU6IGNvbG91ciBkdW1teSBkZXZpY2UgODB4MjUNCj4+Pj4gWyAgICAwLjAxNDY3Nl0g
cHJpbnRrOiBjb25zb2xlIFt0dHkwXSBlbmFibGVkDQo+Pj4+IFsgICAgMC4wMTkyMTddIHByaW50
azogYm9vdGNvbnNvbGUgW25zMTY1NTBhMF0gZGlzYWJsZWQNCj4+Pj4NCj4+Pj4gRldJVyB0aGlz
IGlzIHJpZ2h0IGFib3V0IHdoZW4gdGhlIGNsb2NrIGRyaXZlciBnZXRzIGxvYWRlZA0KPj4+PiBh
cyB5b3UgbWlnaHQgaW1hZ2luZS4NCj4+Pj4NCj4+Pj4gTXkgY29uZmlnIGlzIGhlcmUsIGJ1dCBp
dCdzIGJlZW4gcmVwcm9kdWNlZCBvbiBhIGZldyBkaWZmZXJlbnQNCj4+Pj4gZGVmY29uZmlnczoN
Cj4+Pj4gaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0NvbmNodU9EL3BvbGFyZmly
ZS1zb2MtYnVpbGRyb290LXNkay9kZXYvY29uZi9sb3dtZW0vZGVmY29uZmlnDQo+Pj4+DQo+Pj4+
IE9uIDA0LzA3LzIwMjIgMTM6MTUsIENvbm9yIERvb2xleSB3cm90ZToNCj4+Pj4+IEhleSBhbGws
DQo+Pj4+PiBJIGtub3cgSSBoYXZlIG5vdCBzYXQgb24gdGhlIFJGQyBJIHNlbnQgYWJvdXQgdGhl
IGF1eC4gYnVzIHBhcnRzDQo+Pj4+PiBmb3IgdG9vIGxvbmcsIGJ1dCBmaWd1cmVkIEknZCBqdXN0
IHNlbmQgdGhlIHdob2xlIHRoaW5nIGFueXdheSB0byBhbGwNCj4+Pj4+IGxpc3RzIGV0Yy4NCj4+
Pj4+DQo+Pj4+PiBLaW5kYSB0d28gdGhpbmdzIGhhcHBlbmluZyBpbiB0aGlzIHNlcmllcywgYnV0
IEkgc2VudCBpdCB0b2dldGhlciB0bw0KPj4+Pj4gZW5zdXJlIHRoZSBzZWNvbmQgcGFydCB3b3Vs
ZCBhcHBseSBjb3JyZWN0bHkuDQo+Pj4+Pg0KPj4+Pj4gVGhlIGZpcnN0IGlzIHRoZSByZXNldCBj
b250cm9sbGVyIHRoYXQgSSBwcm9taXNlZCBhZnRlciBkaXNjb3ZlcmluZyB0aGUNCj4+Pj4+IGlz
c3VlIHRyaWdnZXJlZCBieSBDT05GSUdfUE0gJiB0aGUgcGh5IG5vdCBjb21pbmcgdXAgY29ycmVj
dGx5LiBJIGhhdmUNCj4+Pj4+IG5vdyByZW1vdmVkIGFsbCB0aGUgbWVzc2luZyB3aXRoIHJlc2V0
cyBmcm9tIGNsb2NrIGVuYWJsZS9kaXNhYmxlDQo+Pj4+PiBmdW5jdGlvbnMgJiBub3cgdXNlIHRo
ZSBhdXggYnVzIHRvIHNldCB1cCBhIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyLg0KPj4+Pj4gU2lu
Y2UgSSBuZWVkZWQgc29tZXRoaW5nIHRvIHRlc3QgaXQsIEkgaG9va2VkIHVwIHRoZSByZXNldCBm
b3IgdGhlDQo+Pj4+PiBDYWRlbmNlIE1BQ0Igb24gUG9sYXJGaXJlIFNvQy4gVGhpcyBoYXMgYmVl
biBzcGxpdCBpbnRvIGEgc2Vjb25kIHNlcmllcw0KPj4+Pj4gZm9yIHYyOg0KPj4+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNzA0MTE0NTExLjE4OTIzMzItMS1jb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbS8NCj4+Pj4+DQo+Pj4+PiBUaGUgc2Vjb25kIHBhcnQgYWRkcyByYXRl
IGNvbnRyb2wgZm9yIHRoZSBNU1MgUExMIGNsb2NrLCBmb2xsb3dlZCBieQ0KPj4+Pj4gc29tZSBz
aW1wbGlmaWNhdGlvbnMgdG8gdGhlIGRyaXZlciAmIGNvbnZlcnNpb25zIG9mIHNvbWUgY3VzdG9t
IHN0cnVjdHMNCj4+Pj4+IHRvIHRoZSBjb3JyZXNwb25kaW5nIHN0cnVjdHMgaW4gdGhlIGZyYW1l
d29yay4NCj4+Pj4+DQo+Pj4+PiBUaGFua3MsDQo+Pj4+PiBDb25vci4NCj4+Pj4+DQo+Pj4+PiBD
aGFuZ2VzIHNpbmNlIHYxOg0KPj4+Pj4gLSBzcGxpdCBvZmYgdGhlIG5ldCBwYXRjaGVzDQo+Pj4+
PiAtIGNsazogYWN0dWFsbHkgcGFzcyB0aGUgc3BpbmxvY2sgdG8gdGhlIGNvbnZlcnRlZCBkaXZp
ZGVycyAmIGdhdGVzDQo+Pj4+PiAtIHJlc2V0OiBhZGRlZCBhIHNwaW5sb2NrIGFyb3VuZCBSTVcg
YWNjZXNzIHRvIHJlZ2lzdGVycw0KPj4+Pj4gLSByZXNldDogc3dpdGNoZWQgdG8gQklUKGkpIG1h
Y3Jvcw0KPj4+Pj4gLSByZXNldDogdXNlZCBsb2NhbCBjb3BpZXMgb2Ygc29tZSB2YXJpYWJsZXMg
YXMgcG9pbnRlZCBvdXQgYnkgUGhpbGlwcA0KPj4+Pj4gLSByZXNldDogZHJvcHBlZCB0aGUgc3Vj
Y2VzcyBwcmludG91dA0KPj4+Pj4NCj4+Pj4+IENvbm9yIERvb2xleSAoMTIpOg0KPj4+Pj4gICBk
dC1iaW5kaW5nczogY2xrOiBtaWNyb2NoaXA6IG1wZnM6IGFkZCByZXNldCBjb250cm9sbGVyIHN1
cHBvcnQNCj4+Pj4+ICAgY2xrOiBtaWNyb2NoaXA6IG1wZnM6IGFkZCByZXNldCBjb250cm9sbGVy
DQo+Pj4+PiAgIHJlc2V0OiBhZGQgcG9sYXJmaXJlIHNvYyByZXNldCBzdXBwb3J0DQo+Pj4+PiAg
IE1BSU5UQUlORVJTOiBhZGQgcG9sYXJmaXJlIHNvYyByZXNldCBjb250cm9sbGVyDQo+Pj4+PiAg
IHJpc2N2OiBkdHM6IG1pY3JvY2hpcDogYWRkIG1wZnMgc3BlY2lmaWMgbWFjYiByZXNldCBzdXBw
b3J0DQo+Pj4+PiAgIGNsazogbWljcm9jaGlwOiBtcGZzOiBhZGQgbW9kdWxlX2F1dGhvcnMgZW50
cmllcw0KPj4+Pj4gICBjbGs6IG1pY3JvY2hpcDogbXBmczogYWRkIE1TUyBwbGwncyBzZXQgJiBy
b3VuZCByYXRlDQo+Pj4+PiAgIGNsazogbWljcm9jaGlwOiBtcGZzOiBtb3ZlIGlkICYgb2Zmc2V0
IG91dCBvZiBjbG9jayBzdHJ1Y3RzDQo+Pj4+PiAgIGNsazogbWljcm9jaGlwOiBtcGZzOiBzaW1w
bGlmeSBjb250cm9sIHJlZyBhY2Nlc3MNCj4+Pj4+ICAgY2xrOiBtaWNyb2NoaXA6IG1wZnM6IGRl
bGV0ZSAyIGxpbmUgbXBmc19jbGtfcmVnaXN0ZXJfZm9vKCkNCj4+Pj4+ICAgY2xrOiBtaWNyb2No
aXA6IG1wZnM6IGNvbnZlcnQgY2ZnX2NsayB0byBjbGtfZGl2aWRlcg0KPj4+Pj4gICBjbGs6IG1p
Y3JvY2hpcDogbXBmczogY29udmVydCBwZXJpcGhfY2xrIHRvIGNsa19nYXRlDQo+Pj4+Pg0KPj4+
Pj4gIC4uLi9iaW5kaW5ncy9jbG9jay9taWNyb2NoaXAsbXBmcy55YW1sICAgICAgICB8ICAxNyAr
LQ0KPj4+Pj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMSArDQo+Pj4+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbXBmcy5kdHNpICAg
ICAgIHwgICA3ICstDQo+Pj4+PiAgZHJpdmVycy9jbGsvbWljcm9jaGlwL0tjb25maWcgICAgICAg
ICAgICAgICAgIHwgICAxICsNCj4+Pj4+ICBkcml2ZXJzL2Nsay9taWNyb2NoaXAvY2xrLW1wZnMu
YyAgICAgICAgICAgICAgfCAzNzkgKysrKysrKysrLS0tLS0tLS0tDQo+Pj4+PiAgZHJpdmVycy9y
ZXNldC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsNCj4+Pj4+ICBkcml2
ZXJzL3Jlc2V0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4+Pj4+
ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LW1wZnMuYyAgICAgICAgICAgICAgICAgICAgfCAxNTcgKysr
KysrKysNCj4+Pj4+ICBpbmNsdWRlL3NvYy9taWNyb2NoaXAvbXBmcy5oICAgICAgICAgICAgICAg
ICAgfCAgIDggKw0KPj4+Pj4gIDkgZmlsZXMgY2hhbmdlZCwgMzg2IGluc2VydGlvbnMoKyksIDE5
MyBkZWxldGlvbnMoLSkNCj4+Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9yZXNldC9y
ZXNldC1tcGZzLmMNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gYmFzZS1jb21taXQ6IGIxM2JhY2NjMzg1
MGNhOGI4Y2NjYmY4ZWQ5OTEyZGJhYTBmZGY3ZjMNCg==
