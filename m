Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042645B2189
	for <lists+linux-clk@lfdr.de>; Thu,  8 Sep 2022 17:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbiIHPG3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 8 Sep 2022 11:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiIHPG1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 11:06:27 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BF81316FE;
        Thu,  8 Sep 2022 08:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662649587; x=1694185587;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RUeJwtCm1cm0sz+vxCvvwhXHOenkwC5gvRoeep4Cofk=;
  b=fNCVifKXjB5ZrtjsQOIGUD8YgTgnp9WnE+jXA+AVUyQyI6SGFKulz2mm
   18gtxXLtKLEAynLP0pkIy4e8Pc+Ew3c4A43O32FHnuRxH3olZ7z53UEzM
   v9lRMTsDg/W2R50htSt67XAlR2dYc7PEZpLkDZyvyMkcU8sHZm37piOlq
   Ko9N/84mQHsdV2WNI6zzH0U4sJ+1PpnD1gUQFPQbqBEPRjHLpbJ/+5Pg9
   kWzPwp2kRhEjvhqqYb6tTndgUDdY2/MC7RBk+kGqyXVxPm6cb+5Y/zYt4
   nStG8s2+wSWGceRpf/l/nKiyl1d1RB5BcL50wWNSIy4Ojpsn5e2MFhJGV
   w==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="179587794"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 08:06:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 08:06:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Sep 2022 08:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNpl/sg7Rk5KfhsNaNP5eH598Uy9vjyimAp39J5O7fKyND7rqVA0ASRSsubDU3eW0p5d9/RUy8APweliX3nAhpnjWWvoXJuPacqJQXJ1dQ6waIgURPyiKsLsHlsbpmioyxVVwO0sLyVLnOM7OGnf89vNsYAZrQdCvAaK9NHZqAwQNWDJjxtS1xANrI6ypmENHXwt39239GMJFwD2deCFKpEOwThcEAxIGUmPcNazri81OUVbBh7YsZQ5R7pR/IYZllrdtebyrS4xQdGMY1Gu/alGL2sMCqFN4R7yOFoiqTAWldQtosOKakKUDOv63HMGjjlzMObYaVN1x+Ogyi4/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUeJwtCm1cm0sz+vxCvvwhXHOenkwC5gvRoeep4Cofk=;
 b=DdpbMm3c2nTr4mcdeJdTr86zxdeyJmNGX5sHEHgNvWB/fLlVBwZnsEo0R26Yy+IySyNyMB3fSATRI/k4wdTkbLwBC8DlFCaRgHVHEqu/HXEZHRMeeHLzc5RYTrXRqNK1Ic+eO20gWcWbgEcdl72qLkLVBlly33unwxL5yEKMLaqjeTzyzTYNbfYMneCbY9aZAGaNdEdfsFRderSM6Jvd5HwtxMqFdzyy6cLAXhZ3d6r/lUlUFsAL3EprXdqOKIULW0k2F63IybWcC230zx+32kGRaq6lMmFXyduoJab7gO963GumT1mOvfXayLAyH860yspeE3/ltmYYog8H3pnFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUeJwtCm1cm0sz+vxCvvwhXHOenkwC5gvRoeep4Cofk=;
 b=NB4+yK3QTijWdqYv7RRUvfYTVuT79dcGkDAYziNHBH42phCA8P4J5BmkQL0rYUrMQQI+9qwTBUA8SXNShWx2dHTJldD1XoZgGW67fLHnr96B7HZm5r2rSIDoytFlk4/wtIqg8h2iigKhfry5kOzFuU2vdWbu4e+yz5oqY+Dccts=
Received: from BYAPR11MB2758.namprd11.prod.outlook.com (2603:10b6:a02:c9::11)
 by CY4PR11MB1783.namprd11.prod.outlook.com (2603:10b6:903:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 8 Sep
 2022 15:06:11 +0000
Received: from BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::6852:5740:4bc9:d1b4]) by BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::6852:5740:4bc9:d1b4%7]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 15:06:11 +0000
From:   <Sergiu.Moga@microchip.com>
To:     <krzysztof.kozlowski@linaro.org>, <lee@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Claudiu.Beznea@microchip.com>, <richard.genoud@gmail.com>,
        <radu_nicolae.pirea@upb.ro>, <gregkh@linuxfoundation.org>,
        <broonie@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <jirislaby@kernel.org>, <admin@hifiphile.com>,
        <Kavyasree.Kotagiri@microchip.com>, <Tudor.Ambarus@microchip.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 05/13] dt-bindings: serial: atmel,at91-usart: convert
 to json-schema
Thread-Topic: [PATCH v2 05/13] dt-bindings: serial: atmel,at91-usart: convert
 to json-schema
Thread-Index: AQHYwfjByH4K4eAxe0ucv3xGn9LEXq3VeUyAgAAr1QA=
Date:   Thu, 8 Sep 2022 15:06:10 +0000
Message-ID: <fde16d80-28b4-aae6-363f-ad9dcf87a5e1@microchip.com>
References: <20220906135511.144725-1-sergiu.moga@microchip.com>
 <20220906135511.144725-6-sergiu.moga@microchip.com>
 <e799ca9e-acb0-1bea-1c1a-b2ab79089381@linaro.org>
In-Reply-To: <e799ca9e-acb0-1bea-1c1a-b2ab79089381@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1b848dc-19d3-427f-e024-08da91abaa5a
x-ms-traffictypediagnostic: CY4PR11MB1783:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q6GnVhVLozVa1eR5J2e+H7JPP7eymT27A7vyZvbE5OBZhcBXtex7NyVT7E/D5Et9uih2bRL4vEH79gP8g3QZw0DARwvN24+NqGiNDYshtqic5JGGknrb1/UuFIG6d22+0UFaB2P9CdXFe5ncbU57dTd/nzC24lQ6YjlCbXZTADf2XF6At+6BnpC6A7j7+bhdnc1cOJrxiQfdyTfKETDpNKDF+i4UdlI9sDb7QHTLIKktpIlMvCjzWc1p3GKiasaKwA+Q2bECmucuCkuXdeT993zYjfLmrkILFzuALbWkAfmnGIjxlft4NrirqmYEru7M8HpzLC2gsWdOH37AJiKuUGRhHhjRuKLbRBfZmsK8Rp/fxPn9fCDFLQb5UpbV36UBUqZgqAp0lQS/jSOA9XFtMU8i7T6J3nx5tY+c4y8L4i37aQ2ghYlNdLktIsifMFKL116Vr64+m7gUGYCzh6d2hjENQ1QgN10qEklkj/RhS1icp+1Xca5PdhaDS85qCE6A/9LsEvneQI8AYIXMEvtAPTyAV4HwFIXVczUdBkEeh6vTKvOCJhuCstFXFrL6uTAMWYd3DRN/2vv2z3b8wvyPqIwGZVxCdMh1GeKtx9csM5FZGNkOjDsLpeGi6IrQ5s8MCiJXHDURZVKKiGYMaW+WUqX0JiJtZYKcu6fj/KATVT8nO/bIV/b9Q1o3sF2jzGgAkLlAQuqerPL2rs/Y9kqKXXvgHnz65iS9Wt182Id6KolUg3O7k3ak6UsBeGzsfW5HU/EiNGm18HX58mU8oLxaZ5oSg0nUgu5hDkP9l8SkQDi9XPtvTk1OqwTn0wzRRgk3MJ3Lkt0ZD5dDqSNvb7y43nF2grPPIVjRocLc80j0EGif2FBbd6cOOAvp2qKATng2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(396003)(376002)(346002)(38100700002)(122000001)(83380400001)(186003)(2616005)(66556008)(7416002)(2906002)(31686004)(5660300002)(316002)(6636002)(31696002)(54906003)(110136005)(66946007)(8676002)(66476007)(8936002)(91956017)(64756008)(66446008)(4326008)(36756003)(76116006)(6512007)(508600001)(966005)(6486002)(71200400001)(53546011)(26005)(921005)(38070700005)(86362001)(6506007)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2lFUjlEMUcvc2lFdzVldEZlbk93YTBvZTlOTDlzWjJwUzJnUTdaUTFJUzQ5?=
 =?utf-8?B?QnhsaGtDKzNnSVhjTVJJcHNHbkJpeUFWM3VnRkNsK2kzVEF3bjJ1QWtiWVU2?=
 =?utf-8?B?MEJEV0svc05pNEZJeTVHbjRyMlJ3bDIwNGdJdDdXWmVVSDkyOHkyVUZqUm80?=
 =?utf-8?B?SFg3MWZDd05ONjdFaWNSUUhrcG0weVJlNUJOd1Vpdm5MaTlhY2VLdC9EK21k?=
 =?utf-8?B?NEJLQkhDanQ0QVU0SGFIbnhnVGxJbkR1OWhWNnVXczI0VTdidGtUeFp1eDhS?=
 =?utf-8?B?OVZBR2NUV2VydlBzNU5uaUN2ZmdJRWdQZXVvQmQyaE41a1FvOXoyVkpjU3NZ?=
 =?utf-8?B?bmRiZ0NkWGg4SCtpem54V0xIaFFnaDF3cDZmYTdHT1hRUUw4UmNGQllKUVlK?=
 =?utf-8?B?U1BkTU80NHV5ejJNeitsSlhqSVlWVGo1STIzcElnOUpiaVJzblViZ3hpdnll?=
 =?utf-8?B?YnpraEFPb0tBQk54b1BnbTFtNGhoYjhRQm5ieHZ4Rng4NGp6VSt5WHd5eEVm?=
 =?utf-8?B?T0dsQW5ocFg0bkRwL0F5Q2pKMlp6c2taNHMzcElPSndKVG9mdFhOVHE4K0g0?=
 =?utf-8?B?aXNlcEhSNEsxNmNXcFhDQ2d3MkJ6aVhPUnVkMUdWdXJWbHVkWjNGRTIrNW5S?=
 =?utf-8?B?T0FzQ21HVkMyWXpRd1VYZkM0SjZPR3NKWEZmTGNYR0t3UFdNb0xCWFFuajls?=
 =?utf-8?B?c28rMVlXY3F0bkd3NklON0lqTUk2ejMwTS91MGVNY1JaNXBpZnlIS2hJNUdx?=
 =?utf-8?B?UjFHaFNVMnArZkdzWkhwN01qd2tzbWtLOEZ0OEdmbE1GK2ZLTVc5Q21VZmdn?=
 =?utf-8?B?NUN5U1FuTVlrVjFqRGtWS29LNm5tWHRVMlo1bDdlV3VpSTEwUHljeFNQZ3Av?=
 =?utf-8?B?aE81NUJ6VGZUL1VhSDdNQmNqVkNOL28vUVU1Y21LSHVSQzJYSXZ6S1Z5Tmtp?=
 =?utf-8?B?WlYvWVhaRmtWbi94ZWMzU3RXK01EcC91azR3WGo5TUUwSCtLRWYyR1Q4L2Vx?=
 =?utf-8?B?QmFVRVdqd0dWbHpjK3c5RXVvdklDME1NazBJYWg3V1haYTlGTXd5NW84NTdm?=
 =?utf-8?B?QkdQSXNPSERCS3dscE9QVGx6ZzdaRDFySUNFT1BoalFmNEkyVVFrcFd2SmNE?=
 =?utf-8?B?a0NRaDJEM2s4SVUxVG02UEdodmFNdnFRTXZyT21RQjNnL0dMNkFUWXhjZ3hx?=
 =?utf-8?B?VE1nRFdKSTFvOTRvT2FQNE5idUZqa1JyeFNKWnFWNm91dyt6M21pd2tCUGV5?=
 =?utf-8?B?Uk5tK0lvcG13M2tJTFNXdWt0aXg2WDUvLzIxOUd3ekJrbkVqRElCeGVoemtO?=
 =?utf-8?B?cVl0NmFuL2RHMVlVS0Y5aXRQL01vMlM3THdFSG12bDhaajY3NE1pT1B5TUlH?=
 =?utf-8?B?OHRwdGVJVkJLUzV1ZEJGMkdNcTZaYjZra3VXZFBFL0d6eGVzK0liLytPK0ZG?=
 =?utf-8?B?LzMydGhtZmRHVFpRWno0UzlOMkhZcm1HS0FRaFpVNzVDN3BpalFFNDM3RmRF?=
 =?utf-8?B?ZndvSngwaVlreVFqOWhvQjgzSnRjcEdlOGZEK09lQU9YMmgrQlVxVTdKTVNv?=
 =?utf-8?B?OUlJaVZ6YWdQS0hDS0ZOb2ZudHU4dmxGSmhwVXJlUGFlcWMzS2k1MHhGS01G?=
 =?utf-8?B?dkI0RTNsWTJ1ODVoVVlnaldNQU5pOE80dTFwS1F0Y0VJcGZ2ZTVDSUd1allB?=
 =?utf-8?B?M2JxYmI3QlVPTU5FTUNkSmJ2TE5PaGFmTlEwdlNEdVA3Wjk3R2JpRCt6eWxY?=
 =?utf-8?B?M2dReS9NOU9saXdwTEthTTBHcm1JL0kyeHdRZUZteUNNYUgzL2ltRjZMUlpy?=
 =?utf-8?B?NjE3bmdoOEY2Z2pkQ1d1NnNjZzRxMjRmT3RHNjlBaldhalJUNUN2OEo2UWVn?=
 =?utf-8?B?dU8vRGVQY2RaK29OOUlNMnJSbEFGQ1liOFYvN1VXd21MZW1XRXNoRUhYYzBQ?=
 =?utf-8?B?MGxXQU83NkZLLzU5bVVNNjMrdHNCWlYyUXB0ZnZWeW00dVcxS0I2UFdFUmdt?=
 =?utf-8?B?SVZqRVR3RzkwQ1F6ekZKTTFFbFNtRHlmcWhqUngyejVBaWRkTTkyRGg5ck1o?=
 =?utf-8?B?L3lOWWQwMnJFYW41VTRBVkoxRXVwRGR6dWdTSmUwRmJFVEo4NEdrV3RJejRZ?=
 =?utf-8?Q?7bVx8TEmt2cFAphFLnqNJJI2j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2B78D3AF6618946BCC1E399FE532E58@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b848dc-19d3-427f-e024-08da91abaa5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 15:06:10.9239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HcPHucPrUorNm1bBYS7hHGDRgCsCBlRGLfa/gEHC51Qyhte2t6Oh2u5vUabc52tBUYwpgEOQYRF67hltqwsFPlgXzyoc/SUrKeoc/ITmHog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1783
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMDguMDkuMjAyMiAxNToyOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMDYv
MDkvMjAyMiAxNTo1NSwgU2VyZ2l1IE1vZ2Egd3JvdGU6DQo+PiBDb252ZXJ0IGF0OTEgVVNBUlQg
RFQgQmluZGluZyBmb3IgQXRtZWwvTWljcm9jaGlwIFNvQ3MgdG8NCj4+IGpzb24tc2NoZW1hIGZv
cm1hdC4gRnVydGhlcm1vcmUsIG1vdmUgdGhpcyBiaW5kaW5nIHRvIHRoZQ0KPj4gc2VyaWFsIGRp
cmVjdG9yeSwgc2luY2UgYmluZGluZyBkaXJlY3RvcmllcyBtYXRjaCBoYXJkd2FyZSwNCj4+IHVu
bGlrZSB0aGUgZHJpdmVyIHN1YnN5c3RlbXMgd2hpY2ggbWF0Y2ggTGludXggY29udmVudGlvbi4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnaXUgTW9nYSA8c2VyZ2l1Lm1vZ2FAbWljcm9jaGlw
LmNvbT4NCj4+IC0tLQ0KPj4NCj4+DQo+Pg0KPj4gdjEgLT4gdjI6DQo+PiAtIG9ubHkgZG8gd2hh
dCB0aGUgY29tbWl0IHNheXMsIHNwbGl0IHRoZSBhZGRpdGlvbiBvZiBvdGhlciBjb21wYXRpYmxl
cyBhbmQNCj4+IHByb3BlcnRpZXMgaW4gb3RoZXIgcGF0Y2hlcw0KPj4gLSByZW1vdmUgdW5uZWNl
c3NhcnkgInwiJ3MNCj4+IC0gbWVudGlvbiBoZWFkZXIgaW4gYGF0bWVsLHVzYXJ0LW1vZGVgJ3Mg
ZGVzY3JpcHRpb24NCj4+IC0gcGxhY2UgYGlmOmAgdW5kZXIgYGFsbE9mOmANCj4+IC0gcmVzcGVj
dCBvcmRlciBvZiBzcGkwJ3MgRFQgcHJvcGVydGllczogY29tcGF0aWJsZSwgdGhlbiByZWcgdGhl
biB0aGUgcmVzZXQgb2YgcHJvcGVydGllcw0KPj4NCj4+DQo+Pg0KPj4NCj4+DQo+PiAgIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbC11c2FydC50eHQgICB8ICA5OCAtLS0tLS0tLS0t
DQo+PiAgIC4uLi9iaW5kaW5ncy9zZXJpYWwvYXRtZWwsYXQ5MS11c2FydC55YW1sICAgICB8IDE4
MyArKysrKysrKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxODMgaW5zZXJ0aW9u
cygrKSwgOTggZGVsZXRpb25zKC0pDQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLXVzYXJ0LnR4dA0KPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hdG1l
bCxhdDkxLXVzYXJ0LnlhbWwNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbC11c2FydC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLXVzYXJ0LnR4dA0KPj4gZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0DQo+PiBpbmRleCBhMDkxMzMwNjZhZmYuLjAwMDAwMDAwMDAwMA0KPj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbC11c2FydC50eHQNCj4+ICsr
KyAvZGV2L251bGwNCj4+IEBAIC0xLDk4ICswLDAgQEANCj4+IC0qIEF0bWVsIFVuaXZlcnNhbCBT
eW5jaHJvbm91cyBBc3luY2hyb25vdXMgUmVjZWl2ZXIvVHJhbnNtaXR0ZXIgKFVTQVJUKQ0KPj4g
LQ0KPj4gLVJlcXVpcmVkIHByb3BlcnRpZXMgZm9yIFVTQVJUOg0KPj4gLS0gY29tcGF0aWJsZTog
U2hvdWxkIGJlIG9uZSBvZiB0aGUgZm9sbG93aW5nOg0KPj4gLSAgICAgLSAiYXRtZWwsYXQ5MXJt
OTIwMC11c2FydCINCj4+IC0gICAgIC0gImF0bWVsLGF0OTFzYW05MjYwLXVzYXJ0Ig0KPj4gLSAg
ICAgLSAibWljcm9jaGlwLHNhbTl4NjAtdXNhcnQiDQo+PiAtICAgICAtICJhdG1lbCxhdDkxcm05
MjAwLWRiZ3UiLCAiYXRtZWwsYXQ5MXJtOTIwMC11c2FydCINCj4+IC0gICAgIC0gImF0bWVsLGF0
OTFzYW05MjYwLWRiZ3UiLCAiYXRtZWwsYXQ5MXNhbTkyNjAtdXNhcnQiDQo+PiAtICAgICAtICJt
aWNyb2NoaXAsc2FtOXg2MC1kYmd1IiwgIm1pY3JvY2hpcCxzYW05eDYwLXVzYXJ0Ig0KPj4gLS0g
cmVnOiBTaG91bGQgY29udGFpbiByZWdpc3RlcnMgbG9jYXRpb24gYW5kIGxlbmd0aA0KPj4gLS0g
aW50ZXJydXB0czogU2hvdWxkIGNvbnRhaW4gaW50ZXJydXB0DQo+PiAtLSBjbG9jay1uYW1lczog
dHVwbGUgbGlzdGluZyBpbnB1dCBjbG9jayBuYW1lcy4NCj4+IC0gICAgIFJlcXVpcmVkIGVsZW1l
bnRzOiAidXNhcnQiDQo+PiAtLSBjbG9ja3M6IHBoYW5kbGVzIHRvIGlucHV0IGNsb2Nrcy4NCj4+
IC0NCj4+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzIGZvciBVU0FSVCBpbiBTUEkgbW9kZToNCj4+IC0t
ICNzaXplLWNlbGxzICAgICAgOiBNdXN0IGJlIDwwPg0KPj4gLS0gI2FkZHJlc3MtY2VsbHMgICA6
IE11c3QgYmUgPDE+DQo+PiAtLSBjcy1ncGlvczogY2hpcHNlbGVjdHMgKGludGVybmFsIGNzIG5v
dCBzdXBwb3J0ZWQpDQo+PiAtLSBhdG1lbCx1c2FydC1tb2RlIDogTXVzdCBiZSA8QVQ5MV9VU0FS
VF9NT0RFX1NQST4gKGZvdW5kIGluIGR0LWJpbmRpbmdzL21mZC9hdDkxLXVzYXJ0LmgpDQo+PiAt
DQo+PiAtT3B0aW9uYWwgcHJvcGVydGllcyBpbiBzZXJpYWwgYW5kIFNQSSBtb2RlOg0KPj4gLS0g
ZG1hIGJpbmRpbmdzIGZvciBkbWEgdHJhbnNmZXI6DQo+PiAtICAgICAtIGRtYXM6IERNQSBzcGVj
aWZpZXIsIGNvbnNpc3Rpbmcgb2YgYSBwaGFuZGxlIHRvIERNQSBjb250cm9sbGVyIG5vZGUsDQo+
PiAtICAgICAgICAgICAgIG1lbW9yeSBwZXJpcGhlcmFsIGludGVyZmFjZSBhbmQgVVNBUlQgRE1B
IGNoYW5uZWwgSUQsIEZJRk8gY29uZmlndXJhdGlvbi4NCj4+IC0gICAgICAgICAgICAgVGhlIG9y
ZGVyIG9mIERNQSBjaGFubmVscyBpcyBmaXhlZC4gVGhlIGZpcnN0IERNQSBjaGFubmVsIG11c3Qg
YmUgVFgNCj4+IC0gICAgICAgICAgICAgYXNzb2NpYXRlZCBjaGFubmVsIGFuZCB0aGUgc2Vjb25k
IG9uZSBtdXN0IGJlIFJYIGFzc29jaWF0ZWQgY2hhbm5lbC4NCj4+IC0gICAgICAgICAgICAgUmVm
ZXIgdG8gZG1hLnR4dCBhbmQgYXRtZWwtZG1hLnR4dCBmb3IgZGV0YWlscy4NCj4+IC0gICAgIC0g
ZG1hLW5hbWVzOiAidHgiIGZvciBUWCBjaGFubmVsLg0KPj4gLSAgICAgICAgICAgICAgICAgICJy
eCIgZm9yIFJYIGNoYW5uZWwuDQo+PiAtICAgICAgICAgICAgICAgICAgVGhlIG9yZGVyIG9mIGRt
YS1uYW1lcyBpcyBhbHNvIGZpeGVkLiBUaGUgZmlyc3QgbmFtZSBtdXN0IGJlICJ0eCINCj4+IC0g
ICAgICAgICAgICAgICAgICBhbmQgdGhlIHNlY29uZCBvbmUgbXVzdCBiZSAicngiIGFzIGluIHRo
ZSBleGFtcGxlcyBiZWxvdy4NCj4+IC0NCj4+IC1PcHRpb25hbCBwcm9wZXJ0aWVzIGluIHNlcmlh
bCBtb2RlOg0KPj4gLS0gYXRtZWwsdXNlLWRtYS1yeDogdXNlIG9mIFBEQyBvciBETUEgZm9yIHJl
Y2VpdmluZyBkYXRhDQo+PiAtLSBhdG1lbCx1c2UtZG1hLXR4OiB1c2Ugb2YgUERDIG9yIERNQSBm
b3IgdHJhbnNtaXR0aW5nIGRhdGENCj4+IC0tIHtydHMsY3RzLGR0cixkc3Iscm5nLGRjZH0tZ3Bp
b3M6IHNwZWNpZnkgYSBHUElPIGZvciBSVFMvQ1RTL0RUUi9EU1IvUkkvRENEIGxpbmUgcmVzcGVj
dGl2ZWx5Lg0KPj4gLSAgSXQgd2lsbCB1c2Ugc3BlY2lmaWVkIFBJTyBpbnN0ZWFkIG9mIHRoZSBw
ZXJpcGhlcmFsIGZ1bmN0aW9uIHBpbiBmb3IgdGhlIFVTQVJUIGZlYXR1cmUuDQo+PiAtICBJZiB1
bnN1cmUsIGRvbid0IHNwZWNpZnkgdGhpcyBwcm9wZXJ0eS4NCj4+IC0tIGF0bWVsLGZpZm8tc2l6
ZTogbWF4aW11bSBudW1iZXIgb2YgZGF0YSB0aGUgUlggYW5kIFRYIEZJRk9zIGNhbiBzdG9yZSBm
b3IgRklGTw0KPj4gLSAgY2FwYWJsZSBVU0FSVHMuDQo+PiAtLSByczQ4NS1ydHMtZGVsYXksIHJz
NDg1LXJ4LWR1cmluZy10eCwgbGludXgscnM0ODUtZW5hYmxlZC1hdC1ib290LXRpbWU6IHNlZSBy
czQ4NS50eHQNCj4+IC0NCj4+IC08Y2hpcD4gY29tcGF0aWJsZSBkZXNjcmlwdGlvbjoNCj4+IC0t
IGF0OTFybTkyMDA6ICBsZWdhY3kgVVNBUlQgc3VwcG9ydA0KPj4gLS0gYXQ5MXNhbTkyNjA6IGdl
bmVyaWMgVVNBUlQgaW1wbGVtZW50YXRpb24gZm9yIFNBTTkgU29Dcw0KPj4gLQ0KPj4gLUV4YW1w
bGU6DQo+PiAtLSB1c2UgUERDOg0KPj4gLSAgICAgdXNhcnQwOiBzZXJpYWxAZmZmOGMwMDAgew0K
Pj4gLSAgICAgICAgICAgICBjb21wYXRpYmxlID0gImF0bWVsLGF0OTFzYW05MjYwLXVzYXJ0IjsN
Cj4+IC0gICAgICAgICAgICAgcmVnID0gPDB4ZmZmOGMwMDAgMHg0MDAwPjsNCj4+IC0gICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDw3PjsNCj4+IC0gICAgICAgICAgICAgY2xvY2tzID0gPCZ1c2Fy
dDBfY2xrPjsNCj4+IC0gICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAidXNhcnQiOw0KPj4gLSAg
ICAgICAgICAgICBhdG1lbCx1c2UtZG1hLXJ4Ow0KPj4gLSAgICAgICAgICAgICBhdG1lbCx1c2Ut
ZG1hLXR4Ow0KPj4gLSAgICAgICAgICAgICBydHMtZ3Bpb3MgPSA8JnBpb0QgMTUgR1BJT19BQ1RJ
VkVfTE9XPjsNCj4+IC0gICAgICAgICAgICAgY3RzLWdwaW9zID0gPCZwaW9EIDE2IEdQSU9fQUNU
SVZFX0xPVz47DQo+PiAtICAgICAgICAgICAgIGR0ci1ncGlvcyA9IDwmcGlvRCAxNyBHUElPX0FD
VElWRV9MT1c+Ow0KPj4gLSAgICAgICAgICAgICBkc3ItZ3Bpb3MgPSA8JnBpb0QgMTggR1BJT19B
Q1RJVkVfTE9XPjsNCj4+IC0gICAgICAgICAgICAgZGNkLWdwaW9zID0gPCZwaW9EIDIwIEdQSU9f
QUNUSVZFX0xPVz47DQo+PiAtICAgICAgICAgICAgIHJuZy1ncGlvcyA9IDwmcGlvRCAxOSBHUElP
X0FDVElWRV9MT1c+Ow0KPj4gLSAgICAgfTsNCj4+IC0NCj4+IC0tIHVzZSBETUE6DQo+PiAtICAg
ICB1c2FydDA6IHNlcmlhbEBmMDAxYzAwMCB7DQo+PiAtICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiYXRtZWwsYXQ5MXNhbTkyNjAtdXNhcnQiOw0KPj4gLSAgICAgICAgICAgICByZWcgPSA8MHhm
MDAxYzAwMCAweDEwMD47DQo+PiAtICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTIgNCA1PjsN
Cj4+IC0gICAgICAgICAgICAgY2xvY2tzID0gPCZ1c2FydDBfY2xrPjsNCj4+IC0gICAgICAgICAg
ICAgY2xvY2stbmFtZXMgPSAidXNhcnQiOw0KPj4gLSAgICAgICAgICAgICBhdG1lbCx1c2UtZG1h
LXJ4Ow0KPj4gLSAgICAgICAgICAgICBhdG1lbCx1c2UtZG1hLXR4Ow0KPj4gLSAgICAgICAgICAg
ICBkbWFzID0gPCZkbWEwIDIgMHgzPiwNCj4+IC0gICAgICAgICAgICAgICAgICAgIDwmZG1hMCAy
IDB4MjA0PjsNCj4+IC0gICAgICAgICAgICAgZG1hLW5hbWVzID0gInR4IiwgInJ4IjsNCj4+IC0g
ICAgICAgICAgICAgYXRtZWwsZmlmby1zaXplID0gPDMyPjsNCj4+IC0gICAgIH07DQo+PiAtDQo+
PiAtLSBTUEkgbW9kZToNCj4+IC0gICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tZmQvYXQ5MS11
c2FydC5oPg0KPj4gLQ0KPj4gLSAgICAgc3BpMDogc3BpQGYwMDFjMDAwIHsNCj4+IC0gICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiAtICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDA+Ow0KPj4gLSAgICAgICAgICAgICBjb21wYXRpYmxlID0gImF0bWVsLGF0OTFybTkyMDAt
dXNhcnQiLCAiYXRtZWwsYXQ5MXNhbTkyNjAtdXNhcnQiOw0KPj4gLSAgICAgICAgICAgICBhdG1l
bCx1c2FydC1tb2RlID0gPEFUOTFfVVNBUlRfTU9ERV9TUEk+Ow0KPj4gLSAgICAgICAgICAgICBy
ZWcgPSA8MHhmMDAxYzAwMCAweDEwMD47DQo+PiAtICAgICAgICAgICAgIGludGVycnVwdHMgPSA8
MTIgSVJRX1RZUEVfTEVWRUxfSElHSCA1PjsNCj4+IC0gICAgICAgICAgICAgY2xvY2tzID0gPCZ1
c2FydDBfY2xrPjsNCj4+IC0gICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAidXNhcnQiOw0KPj4g
LSAgICAgICAgICAgICBkbWFzID0gPCZkbWEwIDIgQVQ5MV9ETUFfQ0ZHX1BFUl9JRCgzKT4sDQo+
PiAtICAgICAgICAgICAgICAgICAgICA8JmRtYTAgMiAoQVQ5MV9ETUFfQ0ZHX1BFUl9JRCg0KSB8
IEFUOTFfRE1BX0NGR19GSUZPQ0ZHX0FTQVApPjsNCj4+IC0gICAgICAgICAgICAgZG1hLW5hbWVz
ID0gInR4IiwgInJ4IjsNCj4+IC0gICAgICAgICAgICAgY3MtZ3Bpb3MgPSA8JnBpb0IgMyAwPjsN
Cj4+IC0gICAgIH07DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NlcmlhbC9hdG1lbCxhdDkxLXVzYXJ0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2F0bWVsLGF0OTEtdXNhcnQueWFtbA0KPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjI1NTM1YjdhNGQyDQo+PiAtLS0g
L2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2Vy
aWFsL2F0bWVsLGF0OTEtdXNhcnQueWFtbA0KPj4gQEAgLTAsMCArMSwxODMgQEANCj4+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+
ICsjIENvcHlyaWdodCAoQykgMjAyMiBNaWNyb2NoaXAgVGVjaG5vbG9neSwgSW5jLiBhbmQgaXRz
IHN1YnNpZGlhcmllcw0KPj4gKyVZQU1MIDEuMg0KPj4gKy0tLQ0KPj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvc2VyaWFsL2F0bWVsLGF0OTEtdXNhcnQueWFtbCMNCj4+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+
ICsNCj4+ICt0aXRsZTogQXRtZWwgVW5pdmVyc2FsIFN5bmNocm9ub3VzIEFzeW5jaHJvbm91cyBS
ZWNlaXZlci9UcmFuc21pdHRlciAoVVNBUlQpDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiAr
ICAtIFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBnbWFpbC5jb20+DQo+PiArDQo+PiAr
cHJvcGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIG9uZU9mOg0KPj4gKyAgICAg
IC0gZW51bToNCj4+ICsgICAgICAgICAgLSBhdG1lbCxhdDkxcm05MjAwLXVzYXJ0DQo+PiArICAg
ICAgICAgIC0gYXRtZWwsYXQ5MXNhbTkyNjAtdXNhcnQNCj4+ICsgICAgICAgICAgLSBtaWNyb2No
aXAsc2FtOXg2MC11c2FydA0KPj4gKyAgICAgIC0gaXRlbXM6DQo+PiArICAgICAgICAgIC0gY29u
c3Q6IGF0bWVsLGF0OTFybTkyMDAtZGJndQ0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBhdG1lbCxh
dDkxcm05MjAwLXVzYXJ0DQo+PiArICAgICAgLSBpdGVtczoNCj4+ICsgICAgICAgICAgLSBjb25z
dDogYXRtZWwsYXQ5MXNhbTkyNjAtZGJndQ0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBhdG1lbCxh
dDkxc2FtOTI2MC11c2FydA0KPj4gKyAgICAgIC0gaXRlbXM6DQo+PiArICAgICAgICAgIC0gY29u
c3Q6IG1pY3JvY2hpcCxzYW05eDYwLWRiZ3UNCj4+ICsgICAgICAgICAgLSBjb25zdDogbWljcm9j
aGlwLHNhbTl4NjAtdXNhcnQNCj4+ICsNCj4+ICsgIHJlZzoNCj4+ICsgICAgbWF4SXRlbXM6IDEN
Cj4+ICsNCj4+ICsgIGludGVycnVwdHM6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiAr
ICBjbG9jay1uYW1lczoNCj4+ICsgICAgY29uc3Q6IHVzYXJ0DQo+PiArDQo+PiArICBjbG9ja3M6
DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICBkbWFzOg0KPj4gKyAgICBpdGVtczoN
Cj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBUWCBETUEgQ2hhbm5lbA0KPj4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IFJYIERNQSBDaGFubmVsDQo+PiArDQo+PiArICBkbWEtbmFtZXM6DQo+PiArICAg
IGl0ZW1zOg0KPj4gKyAgICAgIC0gY29uc3Q6IHR4DQo+PiArICAgICAgLSBjb25zdDogcngNCj4+
ICsNCj4+ICsgIGF0bWVsLHVzYXJ0LW1vZGU6DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPj4gKyAgICBkZXNjcmlwdGlvbjoNCj4+ICsgICAg
ICBNdXN0IGJlIGVpdGhlciA8QVQ5MV9VU0FSVF9NT0RFX1NQST4gZm9yIFNQSSBvcg0KPj4gKyAg
ICAgIDxBVDkxX1VTQVJUX01PREVfU0VSSUFMPiBmb3IgVVNBUlQgKGZvdW5kIGluIGR0LWJpbmRp
bmdzL21mZC9hdDkxLXVzYXJ0LmgpLg0KPj4gKyAgICBlbnVtOiBbIDAsIDEgXQ0KPj4gKw0KPj4g
K3JlcXVpcmVkOg0KPj4gKyAgLSBjb21wYXRpYmxlDQo+PiArICAtIHJlZw0KPj4gKyAgLSBpbnRl
cnJ1cHRzDQo+PiArICAtIGNsb2NrLW5hbWVzDQo+PiArICAtIGNsb2Nrcw0KPj4gKw0KPj4gK2Fs
bE9mOg0KPj4gKyAgLSBpZjoNCj4+ICsgICAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgICAgJG5v
ZGVuYW1lOg0KPj4gKyAgICAgICAgICBwYXR0ZXJuOiAiXnNlcmlhbEBbMC05YS1mXSskIg0KPiAN
Cj4gWW91IHNob3VsZCByYXRoZXIgY2hlY2sgdmFsdWUgb2YgYXRtZWwsdXNhcnQtbW9kZSwgYmVj
YXVzZSBub3cgeW91IHdvbid0DQo+IHByb3Blcmx5IG1hdGNoIGRldmljZSBub2RlcyBjYWxsZWQg
ImZvb2JhciIuIFNpbmNlIHVzYXJ0LW1vZGUgaGFzIG9ubHkNCj4gdHdvIHBvc3NpYmxlIHZhbHVl
cywgdGhpcyB3aWxsIG5pY2VseSBzaW1wbGlmeSB5b3UgaWYtZWxzZS4NCj4gDQo+IA0KDQoNCkkg
ZGlkIHRoaW5rIG9mIHRoYXQgYnV0IHRoZSBwcmV2aW91cyBiaW5kaW5nIHNwZWNpZmllcyB0aGF0
IA0KYXRtZWwsdXNhcnQtbW9kZSBpcyByZXF1aXJlZCBvbmx5IGZvciB0aGUgU1BJIG1vZGUgYW5k
IGl0IGlzIG9wdGlvbmFsIA0KZm9yIHRoZSBVU0FSVCBtb2RlLiBUaGF0IGlzIHdoeSBJIHdlbnQg
Zm9yIHRoZSBub2RlJ3MgcmVnZXggc2luY2UgSSANCnRob3VnaHQgaXQgaXMgc29tZXRoaW5nIHRo
YXQgYm90aCBub2RlcyB3b3VsZCBoYXZlLg0KDQoNCj4+ICsgICAgdGhlbjoNCj4+ICsgICAgICBh
bGxPZjoNCj4+ICsgICAgICAgIC0gJHJlZjogL3NjaGVtYXMvc2VyaWFsL3NlcmlhbC55YW1sIw0K
Pj4gKyAgICAgICAgLSAkcmVmOiAvc2NoZW1hcy9zZXJpYWwvcnM0ODUueWFtbCMNCj4+ICsNCj4+
ICsgICAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgICAgYXRtZWwsdXNlLWRtYS1yeDoNCj4+ICsg
ICAgICAgICAgdHlwZTogYm9vbGVhbg0KPj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogdXNlIG9m
IFBEQyBvciBETUEgZm9yIHJlY2VpdmluZyBkYXRhDQo+PiArDQo+PiArICAgICAgICBhdG1lbCx1
c2UtZG1hLXR4Og0KPj4gKyAgICAgICAgICB0eXBlOiBib29sZWFuDQo+PiArICAgICAgICAgIGRl
c2NyaXB0aW9uOiB1c2Ugb2YgUERDIG9yIERNQSBmb3IgdHJhbnNtaXR0aW5nIGRhdGENCj4+ICsN
Cj4+ICsgICAgICAgIGF0bWVsLGZpZm8tc2l6ZToNCj4+ICsgICAgICAgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+PiArICAgICAgICAgIGRlc2NyaXB0
aW9uOg0KPj4gKyAgICAgICAgICAgIE1heGltdW0gbnVtYmVyIG9mIGRhdGEgdGhlIFJYIGFuZCBU
WCBGSUZPcyBjYW4gc3RvcmUgZm9yIEZJRk8NCj4+ICsgICAgICAgICAgICBjYXBhYmxlIFVTQVJU
Uy4NCj4+ICsgICAgICAgICAgZW51bTogWyAxNiwgMzIgXQ0KPiANCj4gSSBkaWQgbm90IG1lbnRp
b24gaXQgbGFzdCB0aW1lLCBidXQgSSB0aGluayBpdCBzaG91bGQgZm9sbG93IGdlbmVyaWMNCj4g
cHJhY3RpY2UsIHNvIGRlZmluZSBhbGwgcHJvcGVydGllcyB0b3AtbGV2ZWwgYW5kIGRpc2FsbG93
IHRoZW0gZm9yIG90aGVyDQo+IHR5cGUuIFRoaXMgYWxsb3dzIHlvdSB0byBzaW1wbHkgdXNlIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOmZhbHNlIGF0IHRoZSBlbmQuDQo+IA0KDQoNCldoYXQgd291bGQg
YmUgYSBnb29kIGV4YW1wbGUgYmluZGluZyBpbiB0aGlzIGNhc2U/DQoNCg0KPj4gKw0KPj4gKyAg
ICBlbHNlOg0KPj4gKyAgICAgIGlmOg0KPj4gKyAgICAgICAgcHJvcGVydGllczoNCj4+ICsgICAg
ICAgICAgJG5vZGVuYW1lOg0KPj4gKyAgICAgICAgICAgIHBhdHRlcm46ICJec3BpQFswLTlhLWZd
KyQiDQo+PiArICAgICAgdGhlbjoNCj4+ICsgICAgICAgIGFsbE9mOg0KPj4gKyAgICAgICAgICAt
ICRyZWY6IC9zY2hlbWFzL3NwaS9zcGktY29udHJvbGxlci55YW1sIw0KPj4gKw0KPj4gKyAgICAg
ICAgcHJvcGVydGllczoNCj4+ICsgICAgICAgICAgYXRtZWwsdXNhcnQtbW9kZToNCj4+ICsgICAg
ICAgICAgICBjb25zdDogMQ0KPj4gKw0KPj4gKyAgICAgICAgICAiI3NpemUtY2VsbHMiOg0KPj4g
KyAgICAgICAgICAgIGNvbnN0OiAwDQo+PiArDQo+PiArICAgICAgICAgICIjYWRkcmVzcy1jZWxs
cyI6DQo+PiArICAgICAgICAgICAgY29uc3Q6IDENCj4gDQo+IFRoZSBzYW1lIC0gdG9wIGxldmVs
IGFuZCBkaXNhbGxvdyB0aGVtIGZvciB1YXJ0Lg0KPiANCg0KDQpUaGVzZSB2YWx1ZXMgb2YgI3Np
emUtY2VsbHMgYW5kICNhZGRyZXNzLWNlbGxzIGFyZSBvbmx5IG1lYW50IGZvciB0aGUgDQpTUEkg
c28gSSBndWVzcyBJIHdvdWxkIHN0aWxsIGhhdmUgdG8gc3BlY2lmeSB0aGVpciBtYW5kYXRvcnkg
Y29uc3QgDQp2YWx1ZXMgaGVyZS4NCg0KDQo+PiArDQo+PiArICAgICAgICByZXF1aXJlZDoNCj4+
ICsgICAgICAgICAgLSBhdG1lbCx1c2FydC1tb2RlDQo+PiArICAgICAgICAgIC0gIiNzaXplLWNl
bGxzIg0KPj4gKyAgICAgICAgICAtICIjYWRkcmVzcy1jZWxscyINCj4gDQo+IEVuZCBlbHNlIGlu
IHRoaXMgYnJhbmNoIGlzIHdoYXQ/DQo+IA0KDQoNCllvdSBhcmUgcmlnaHQsIEkgd2lsbCByZW1v
dmUgdGhlIHVzZWxlc3MgaWY6IGFmdGVyIGVsc2U6DQoNCg0KPj4gKw0KPj4gK3VuZXZhbHVhdGVk
UHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9m
DQoNCg0KUmVnYXJkcywNCglTZXJnaXUNCg==
