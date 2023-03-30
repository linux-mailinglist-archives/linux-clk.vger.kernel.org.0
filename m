Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC1B6CFCCD
	for <lists+linux-clk@lfdr.de>; Thu, 30 Mar 2023 09:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjC3Hb4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Mar 2023 03:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbjC3Hbh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 03:31:37 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D14D6195;
        Thu, 30 Mar 2023 00:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQgd7vOWKm+9YFRYz34nywY/LmFSQ5UCYph1sQZVlEr1g9Xc9lntFlTb6DZ9dCqd3K8Qwxu9q94rOv//U9qQv0lcFp6fB2nsgAoBef5DCN3VsHmUhGy0AOehUbuTT5lAAM2AG6Bx/Po4rS4VGPcpPT1nJ36gGQyR9ZTlfSyJvB6DBHBhmjm25ykYMCSGU9phT39xL9a66pyWN13nX7OSDPdI41FPxMuoOapwVxqDdc9KIHNMh161h9p5Y2o2uFJ2jxSaujMk5LPJ01It6OiQFK0YlnpZFtT8+SfkH6zC1R4SKVFsNXfpJuJtrxYwpLuRKDhcJKCJBjRPxsMLBFxoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElPKeWxhxVnYUGGXTrmzfyRvqdBX5ib8gkbxu4AqSKY=;
 b=Koc4pLYHH7mNq/uUGuK1AWvHnu7BjwR8WWTwKkqascvARvceHFSjIedkeQorvAzIi01Cv2B4H50daXWdQDmcJ9ys9xuYDMfxXzFM20KCd7+mPRDPihZsGnKM+dtzmcZptGOwyjZC3VB2wkyiuoGK1Z0abborFHbU7JS7pIjU+gh+Ra89k2PYz14H7FCHYOouai2GuKitiNGg03SfuKk1Xr/67xprj5vsTfFh12ad3lYcFXbQJOxlJxr4SIaZOJgd5TfoWXID40T/BgfWV6rWDL0vTkpSTPRrPf3V2EoXdLrRGUum4nrzS+ZazdWqzBvgHwMaRdNjTaXxCy09SM90PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElPKeWxhxVnYUGGXTrmzfyRvqdBX5ib8gkbxu4AqSKY=;
 b=vrlNFvKhP+kcQJTO2rdcttQKX2N6SSnNsTSWn8+BmE5e4Yd8tA1ZfDAVnaUuGDTcNsYYkRmZgDHLLAfCPd+9da8e9glcA7QDWmoN8qbtQ/GBU41VSeHGYUBJ+gR19ZqYoZhNwyXboIsWx6ajBv3am3CdAd63f2ByD0UnkqIHWNs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8260.jpnprd01.prod.outlook.com (2603:1096:604:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 07:31:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 07:31:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Topic: [PATCH v2 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Index: AQHZUqf9CaO1kLmgWEey5fqAuaKaea8F8OiAgAOxxDCABWQpAIABkgLggAGZEACAANlGsA==
Date:   Thu, 30 Mar 2023 07:31:26 +0000
Message-ID: <OS0PR01MB5922F74B642A4DE51D082DED868E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230309165529.223052-1-biju.das.jz@bp.renesas.com>
 <20230309165529.223052-3-biju.das.jz@bp.renesas.com>
 <fbb9d1bf8643b4ddce6e9498911f3137.sboyd@kernel.org>
 <OS0PR01MB5922FA11271563F1FBAC3FED86849@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <b8e22286a7d1995f2e74c4dd3fec88a8.sboyd@kernel.org>
 <OS0PR01MB592215D4433973416B550BA086889@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <bc175ee5522d2d48ccef8b192c2a08d7.sboyd@kernel.org>
In-Reply-To: <bc175ee5522d2d48ccef8b192c2a08d7.sboyd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8260:EE_
x-ms-office365-filtering-correlation-id: 681a9ec1-b1e8-4112-e2f3-08db30f0c5ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QOwbslmh9nTYyj/OV8Cwui4nCAY1Yyh2Qtir6l9+lEZMeKvXOemtS/wSlSUVZIWYOEqF/qE8llCCAadfn2eY4YixyIBRnYZuvKPNxcx/g5UVHTjPUOYRTMLzK+vsceuP1LjKvKe1oavtP1TaZ/CkJC567IHL9WKKn1CkqXnXzdY/vlDPh1NRmTkpSDjBT1f3KtOHKfgwI+4HFoTfsKM9YIK69h5o/VHTayrTBjBFGKqzjRPlDQkzH3vHqCU8L4vaIWhc8npGPvQ7O+AW6MZV07Wffmwb2m1J5nsHXt1AZanTqd8zBLBi87EyMF4sHcJMeeFKgmVdQa3ipCV70iChmBPV4aQsJbGSHQdIpyYMhomSOXIVpR6ztejwGOa3vFinkQTLoLIess5TkeHLTA++PZQucc2ZhVSfSS9B8FbkouEXrfR2VSYC30jqxgiwJ1ZUCWaqWdc+cW+1w0TW+2eNMOK6PzjkumrdV/pE94wfQY1x0gJF0DiH+B08sAzZ054zhKwygxnTQp6269e0PTQU+ItlYlLLF4CZTsRWf8bTt2z9eVe+VEj2hotdZZVlFn44jG9wu6nJWvxAsATXIxiVVDgvwK47rA+lF5qa9d17+pmnU/PxF8ZM0us/7jt2z2WL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(54906003)(71200400001)(478600001)(316002)(110136005)(186003)(83380400001)(38100700002)(33656002)(86362001)(38070700005)(122000001)(55016003)(8936002)(26005)(9686003)(6506007)(7696005)(5660300002)(52536014)(2906002)(66446008)(66476007)(66556008)(66946007)(4326008)(64756008)(8676002)(76116006)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXhyd0dPbUZTSmZXQ0RPMitobXhzK2JtRUo5YTd3NHYzRGdoL1NwS1ZBUENP?=
 =?utf-8?B?YUszcitMUXAwdG1kQitSd0VsN2FyWlE4UUVkQmRmU0w3YlZvWGIxREhrOGR3?=
 =?utf-8?B?ckhUSVlsSlN1VWJHdFB0VTNDaGQ0TFVUUTE2WWJiaGMrN1RRN0dwbmxkeXFk?=
 =?utf-8?B?QkdoUGZYa0o4bS81a2JwM2p2SmlpMktBZUFYcDYzeW5nb1pOK2VFb0t4dTBN?=
 =?utf-8?B?Nk50VW5uWlFLaVRsT21CemlRTEtYZHZsTmo5Z2VWZkJJa0NsdGE5Vk9EZkdl?=
 =?utf-8?B?ZytYYWtjc3BBUENCcEsxZ21CL1JkY2hIVG1ZbllBZUlwZnduMXBIS2orV0I5?=
 =?utf-8?B?a2NrYTZWenlzTjBPbUZBNkhvK3VZb28zZWhBMkYvYThKbmFFNXFCNFp4VVI1?=
 =?utf-8?B?UnM2SXpTU3h4YVdQWDJBdEllTEw1VUUwSFhIbkZuOWRFUUlOcEdWNFBXZWVB?=
 =?utf-8?B?Z0pCZ1l3dVh0RXdCU1dYQlQ5YU9ZT3R6SjdudlpTT3NYa3NIZjNaU1Jldy9u?=
 =?utf-8?B?VHRNc3dxakROa2VjaWlYVU9kUTdOeFR2TVlnWUJwenRNUlBDQ2M4Ri9aVUNO?=
 =?utf-8?B?aUxCc210UGZGdlN5a0JEMXRVZzNpOVlRcFhUYTk0MXBIdEgwZlBVSVBId0xP?=
 =?utf-8?B?TDlaN3JNaEZzTm5DU090VFQ5ZnRGVzM3d1ovU2lveG1HRCtSaGdDZms4V0hj?=
 =?utf-8?B?elNPNHhaaUlQZEE3eTV0TDViZGhuZ3lsS1B1VWp4aW5GT1pVZk00YWNIYzJH?=
 =?utf-8?B?SUJvUFJIREs3aDQvWmhOOE0vZThGWTVYNDVMUk1iUU5jWitkNC9UOGl4MUFY?=
 =?utf-8?B?cWNISzRuYjF0MCtYbEI1VVhyTkd0ZkJWb2o0SzZGaWd3eFh6RkVlajEwQmgy?=
 =?utf-8?B?aWFpTG9VWXhwTExtS0RlSkNzQmJhV3NjUjhJSG1wTkVXbVEzQW96d2IxV2M0?=
 =?utf-8?B?NU1DWkE2QXozZTVZaGdUNjlLNXgwWVFuZElPTXp3cTU4TWozSlp6K0h5VGpU?=
 =?utf-8?B?R3VFU1Iva2JOdFhxcFgvMThlVUllbTJnU0lnaVhSRnB5dk0zOUVucjhLTzJl?=
 =?utf-8?B?SGJ1K2N2bGlkNlZueUpGSEVuTzJtNi9YOFI4cVZQdXpsbXBUNUpReDRhL29I?=
 =?utf-8?B?ZWVRR1VxdXJzUUxjT09rVUJQYlErRDdiaW5WWENKcDEybUo3TWROMWpvNlFD?=
 =?utf-8?B?WWRCVnlZR2xGZFhYdFNXRUNvUUlkazdBM01CWldGQ3k1a1hkSzdzNWM4N3Jn?=
 =?utf-8?B?Q09kVUpWUkRFTXlDWVZyRmEwNDJwajRiRjBxUDBoaHJIdmlRUjdvTGdZWUJj?=
 =?utf-8?B?ekU4WWVRdG00dEZaajU0OUhmSldtV0Y0RVZrNjNabGRyYXdsR0s3Y3M2R01m?=
 =?utf-8?B?dzNHVW1PazF1WkxOVjdlZnNLaEpoNjJuanRBc050Y0UwZlNQeS8vOWNYTDJn?=
 =?utf-8?B?d0JQM01scWhRNE1NVHBiOHJSTzNtZVdqZG9lYVBpUFg3WGFwVUp5Q1hjTWFw?=
 =?utf-8?B?TGpCQ0NCeWhjUnFneTljT0VncVQyL3NDY2Z3OVFhYmhBUjFSNjJPRFBZREFD?=
 =?utf-8?B?b0dEUEJvNG1RS2EyNE55dlNROTlTOHVNNnliM3hudDNyUlFET2pZakdJRWRq?=
 =?utf-8?B?eURkWnc0WWR3S2U4S1laWmErTEY4WU9YV0daVE5QQXBTNG9tV2tSejk5M0ht?=
 =?utf-8?B?WFl6bVBWMUtWLyttcUhMakpMbmQvM09nY0o0NndoMjY2Q29jNVgxYWtUSFlp?=
 =?utf-8?B?bVBYaGtkUFJieFFsOEwwSENvZndsYzFVMVQvU1VvRUtza1lyM3ZtYnNrdExh?=
 =?utf-8?B?Zlc1c1ZaWDZScG1vY05YeDI5QUd1ZStJWDl5OGgwTzZkS3NmVzB3RDNVb0tz?=
 =?utf-8?B?c05IYlRSd1ZkbFBoR21VQVR0YWpiNFNOZFcwWmQ5M0p6MElzK0xDZFNnV1FM?=
 =?utf-8?B?d3NSdDU2OThNZGsyeUpzdWo4VHNHVDhULy9IcHBPQ01wdEpQWGVQUGwyaVR5?=
 =?utf-8?B?T1BVeGZFb3FOUkNMcHErTnY5OTNuN2g4UGg4UTFYdnFoQTVOZjcxN25mUGox?=
 =?utf-8?B?dWg3Zi9UOVlONEUxRXNhOHdUZDREV3FqbkNxRkY5ZFlPZWp4ciswQTcvek81?=
 =?utf-8?Q?yQnPTUczunvOkvARfiNCOGj1W?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681a9ec1-b1e8-4112-e2f3-08db30f0c5ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 07:31:26.9220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4nPxQgQMDnlpOGNtEKKwJiC6qfSaahbKZ8sxpEoE2gfQDZfU3bM+7l9waREsHYNG9H1V8s2zgcEXCMXdsE0rrHvBHzrix+k+UkY0sQtCvsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8260
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQpIaSBTdGVwaGVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KDQo+IFN1YmplY3Q6
IFJFOiBbUEFUQ0ggdjIgMi8zXSBkcml2ZXJzOiBjbGs6IEFkZCBzdXBwb3J0IGZvciB2ZXJzYTMg
Y2xvY2sNCj4gZHJpdmVyDQo+IA0KPiBRdW90aW5nIEJpanUgRGFzICgyMDIzLTAzLTI4IDExOjA3
OjU5KQ0KPiA+DQo+ID4gU3RyZWFtIHBhcmFtZXRlcnMgYXJlIFsgICAzNS4wNTE1NDRdICMjIyMj
IyB2YzNfY2xrX291dF9yb3VuZF9yYXRlDQo+IHJhdGU9MTIyODgwMDANCj4gPiA0ODAwMEh6LCBT
MTZfTEUsWyAgIDM1LjA1MTU5MF0gIyMjIyMjIHZjM19jbGtfb3V0X3JvdW5kX3JhdGUgcmF0ZT0x
MjI4ODAwMA0KPiA+ICAyIGNoYW5uZWxzDQo+ID4gVXNpbmcgMTYgb2NbICAgMzUuMDU4MjA2XSAj
IyMjIyMgdmMzX2Nsa19vdXRfcmVjYWxjX3JhdGUNCj4gcGFyZW50X3JhdGU9MTIyODc5OTgNCj4g
PiB0YXZlcyBvZiBwaW5rIG5vaXNlDQo+ID4gUmF0ZSBzZXQgdG8gNDgwMDBIeiAocmVxdWVzdGVk
IDQ4MDAwSHopDQo+ID4NCj4gPiBOb3RlOg0KPiA+ICBJIGhhdmUgdHJpZWQgdGFraW5nIG91dCBj
bGtfb3BzIGFuZCByZXBsYWNlZCBiZWxvdyBjYWxscyBpbg0KPiA+IHZjM19vZl9jbGtfZ2V0KCks
DQo+ID4NCj4gPiBUaGUgY2xrIG11eCBkb2Vzbid0IGdldCBjYWxsYmFja3MgZHVyaW5nIHBsYXli
YWNrIHRvIGNoYW5nZSB0aGUgcmF0ZXMuDQo+ID4NCj4gPiAgICAgICAgIGlmIChpZHggPT0gVkMz
X1JFRikNCj4gPiAgICAgICAgICAgICAgICAgaHcgPSBkZXZtX2Nsa19od19yZWdpc3Rlcl9maXhl
ZF9mYWN0b3IoZGV2LCBuYW1lLCAieHRhbCIsDQo+ID4NCj4gQ0xLX1NFVF9SQVRFX1BBUkVOVCwg
MSwgMSk7DQo+ID4gICAgICAgICBlbHNlDQo+ID4gICAgICAgICAgICAgICAgIGh3ID0gZGV2bV9j
bGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9yX3BhcmVudF9odyhkZXYsDQo+IG5hbWUsICZjbGtf
bXV4W2lkeF0uaHcsDQo+ID4NCj4gPiBDTEtfU0VUX1JBVEVfUEFSRU5ULCAxLCAxKTsNCj4gDQo+
IERvZXMgdGhlIGNsayB0aGF0IGlzIGEgY2hpbGQgb2YgdGhlIGZpeGVkIGZhY3RvciAxLzEgY2xr
IGFsc28gaGF2ZQ0KPiBDTEtfU0VUX1JBVEVfUEFSRU5UIGZsYWcgc2V0Pw0KDQpUaGVyZSBpcyBu
byBjaGlsZCBmb3IgZml4ZWQgZmFjdG9yIDEvMSBjbGsuIEkganVzdCBkcm9wcGVkIGNsay1mb3Bz
IGFuZA0KVXNlZCBmaXhlZCBmYWN0b3IgMS8xIGZvciBvdXRwdXQgY2xrcyBhbmQgYWxsIHBhcmVu
dHMgb2YgdGhlIG91dHB1dCBjbGtzIGlzDQpoYXZlIENMS19TRVRfUkFURV9QQVJFTlQgZmxhZyBz
ZXQuDQoNCmRpZmYyLW11eCBpcyBwYXJlbnQgb2YgZml4ZWQgZmFjdG9yIDEvMSAiZGlmZjIiIG91
dHB1dCBjbGsNCmRpZmYxLW11eCBpcyBwYXJlbnQgb2YgZml4ZWQgZmFjdG9yIDEvMSAiZGlmZjEi
IG91dHB1dCBjbGsNCnNlMy1tdXggaXMgcGFyZW50IG9mIGZpeGVkIGZhY3RvciAxLzEgInNlMyIg
b3V0cHV0IGNsaw0Kc2UyLW11eCBpcyBwYXJlbnQgb2YgZml4ZWQgZmFjdG9yIDEvMSAic2UyIiBv
dXRwdXQgY2xrDQpzZTEtbXV4IGlzIHBhcmVudCBvZiBmaXhlZCBmYWN0b3IgMS8xICJzZTEiIG91
dHB1dCBjbGsNCnh0YWwgaXMgcGFyZW50IG9mIGZpeGVkIGZhY3RvciAxLzEgInJlZiIgb3V0cHV0
IGNsaw0KDQpzdGF0aWMgc3RydWN0IHZjM19od19kYXRhIGNsa19tdXhbXSA9IHsNCglbVkMzX0RJ
RkYyX01VWF0gPSB7DQoJCS5kYXRhID0gJihzdHJ1Y3QgdmMzX2Nsa19kYXRhKSB7DQoJCQkub2Zm
cyA9IFZDM19ESUZGMl9DVFJMX1JFRywNCgkJCS5iaXRtc2sgPSBWQzNfRElGRjJfQ1RSTF9SRUdf
RElGRjJfQ0xLX1NFTA0KCQl9LA0KCQkuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2RhdGEp
ew0KCQkJLm5hbWUgPSAiZGlmZjJfbXV4IiwNCgkJCS5vcHMgPSAmdmMzX2Nsa19tdXhfb3BzLA0K
CQkJLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsNCgkJCQkmY2xrX2Rp
dltWQzNfRElWMV0uaHcsDQoJCQkJJmNsa19kaXZbVkMzX0RJVjNdLmh3DQoJCQl9LA0KCQkJLm51
bV9wYXJlbnRzID0gMiwNCgkJCS5mbGFncyA9IENMS19TRVRfUkFURV9QQVJFTlQNCgkJfQ0KCX0s
DQoJW1ZDM19ESUZGMV9NVVhdID0gew0KCQkuZGF0YSA9ICYoc3RydWN0IHZjM19jbGtfZGF0YSkg
ew0KCQkJLm9mZnMgPSBWQzNfRElGRjFfQ1RSTF9SRUcsDQoJCQkuYml0bXNrID0gVkMzX0RJRkYx
X0NUUkxfUkVHX0RJRkYxX0NMS19TRUwNCgkJfSwNCgkJLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtf
aW5pdF9kYXRhKXsNCgkJCS5uYW1lID0gImRpZmYxX211eCIsDQoJCQkub3BzID0gJnZjM19jbGtf
bXV4X29wcywNCgkJCS5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7DQoJ
CQkJJmNsa19kaXZbVkMzX0RJVjFdLmh3LA0KCQkJCSZjbGtfZGl2W1ZDM19ESVYzXS5odw0KCQkJ
fSwNCgkJCS5udW1fcGFyZW50cyA9IDIsDQoJCQkuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5U
DQoJCX0NCgl9LA0KCVtWQzNfU0UzX01VWF0gPSB7DQoJCS5kYXRhID0gJihzdHJ1Y3QgdmMzX2Ns
a19kYXRhKSB7DQoJCQkub2ZmcyA9IFZDM19TRTNfRElGRjFfQ1RSTF9SRUcsDQoJCQkuYml0bXNr
ID0gVkMzX1NFM19ESUZGMV9DVFJMX1JFR19TRTNfQ0xLX1NFTA0KCQl9LA0KCQkuaHcuaW5pdCA9
ICYoc3RydWN0IGNsa19pbml0X2RhdGEpew0KCQkJLm5hbWUgPSAic2UzX211eCIsDQoJCQkub3Bz
ID0gJnZjM19jbGtfbXV4X29wcywNCgkJCS5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtf
aHcgKltdKSB7DQoJCQkJJmNsa19kaXZbVkMzX0RJVjJdLmh3LA0KCQkJCSZjbGtfZGl2W1ZDM19E
SVY0XS5odw0KCQkJfSwNCgkJCS5udW1fcGFyZW50cyA9IDIsDQoJCQkuZmxhZ3MgPSBDTEtfU0VU
X1JBVEVfUEFSRU5UDQoJCX0NCgl9LA0KCVtWQzNfU0UyX01VWF0gPSB7DQoJCS5kYXRhID0gJihz
dHJ1Y3QgdmMzX2Nsa19kYXRhKSB7DQoJCQkub2ZmcyA9IFZDM19TRTJfQ1RSTF9SRUcwLA0KCQkJ
LmJpdG1zayA9IFZDM19TRTJfQ1RSTF9SRUcwX1NFMl9DTEtfU0VMDQoJCX0sDQoJCS5ody5pbml0
ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSl7DQoJCQkubmFtZSA9ICJzZTJfbXV4IiwNCgkJCS5v
cHMgPSAmdmMzX2Nsa19tdXhfb3BzLA0KCQkJLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0IGNs
a19odyAqW10pIHsNCgkJCQkmY2xrX2RpdltWQzNfRElWNV0uaHcsDQoJCQkJJmNsa19kaXZbVkMz
X0RJVjRdLmh3DQoJCQl9LA0KCQkJLm51bV9wYXJlbnRzID0gMiwNCgkJCS5mbGFncyA9IENMS19T
RVRfUkFURV9QQVJFTlQNCgkJfQ0KCX0sDQoJW1ZDM19TRTFfTVVYXSA9IHsNCgkJLmRhdGEgPSAm
KHN0cnVjdCB2YzNfY2xrX2RhdGEpIHsNCgkJCS5vZmZzID0gVkMzX1NFMV9ESVY0X0NUUkwsDQoJ
CQkuYml0bXNrID0gVkMzX1NFMV9ESVY0X0NUUkxfU0UxX0NMS19TRUwNCgkJfSwNCgkJLmh3Lmlu
aXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKXsNCgkJCS5uYW1lID0gInNlMV9tdXgiLA0KCQkJ
Lm9wcyA9ICZ2YzNfY2xrX211eF9vcHMsDQoJCQkucGFyZW50X2h3cyA9IChjb25zdCBzdHJ1Y3Qg
Y2xrX2h3ICpbXSkgew0KCQkJCSZjbGtfZGl2W1ZDM19ESVY1XS5odywNCgkJCQkmY2xrX2RpdltW
QzNfRElWNF0uaHcNCgkJCX0sDQoJCQkubnVtX3BhcmVudHMgPSAyLA0KCQkJLmZsYWdzID0gQ0xL
X1NFVF9SQVRFX1BBUkVOVA0KCQl9DQoJfQ0KfTsNCg0KDQoNCnh0YWwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwICAgICAgICAg
IDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgIHJlZiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwICAgICAgICAgIDAgICAgIDAg
IDUwMDAwICAgICAgICAgWQ0KICAgIHBmZDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
ICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAg
ICAgICAgWQ0KICAgICAgIHBsbDEgICAgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgICAw
ICAgICAgICAwICAgNjAwMDAwMDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0K
ICAgICAgICAgIGRpdjIgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAw
ICAgIDEyMDAwMDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAg
ICAgIHNlM19tdXggICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDEyMDAw
MDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgICAgICAgIHNl
MyAgICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDEyMDAwMDAwICAgICAg
ICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgIGRpdjFfbXV4ICAgICAgICAg
ICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgNjAwMDAwMDAwICAgICAgICAgIDAgICAg
IDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgICAgIGRpdjEgICAgICAgICAgICAgICAgICAg
ICAwICAgICAgICAwICAgICAgICAwICAgIDI1MDAwMDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAw
ICAgICAgICAgWQ0KICAgICAgICAgICAgICAgIGRpZmYxX211eCAgICAgICAgICAgICAwICAgICAg
ICAwICAgICAgICAwICAgIDI1MDAwMDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAg
WQ0KICAgICAgICAgICAgICAgICAgIGRpZmYxICAgICAgICAgICAgICAwICAgICAgICAwICAgICAg
ICAwICAgIDI1MDAwMDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgIHBm
ZDNfbXV4ICAgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0
MDAwMDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgIHBmZDMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgICAgOTYwMDAwICAg
ICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgIHBsbDMgICAgICAgICAg
ICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgNTY0NDgwMDAwICAgICAgICAgIDAg
ICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgICAgIGRpdjUgICAgICAgICAgICAgICAg
ICAgICAwICAgICAgICAwICAgICAgICAwICAgIDExMjg5NjAwICAgICAgICAgIDAgICAgIDAgIDUw
MDAwICAgICAgICAgWQ0KICAgICAgICAgICAgICAgIHNlMV9tdXggICAgICAgICAgICAgICAwICAg
ICAgICAwICAgICAgICAwICAgIDExMjg5NjAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAg
ICAgWQ0KICAgICAgICAgICAgICAgICAgIHNlMSAgICAgICAgICAgICAgICAwICAgICAgICAwICAg
ICAgICAwICAgIDExMjg5NjAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAg
ICAgICAgICAgICAgIHNlMl9tdXggICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAg
IDExMjg5NjAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgICAg
ICAgICAgIHNlMiAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDExMjg5NjAw
ICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgIHBmZDJfbXV4ICAgICAgICAg
ICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwICAgICAgICAg
IDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgIHBmZDIgICAgICAgICAgICAgICAgICAg
ICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwICAgICAgICAgIDAgICAgIDAg
IDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgIHBsbDIgICAgICAgICAgICAgICAgICAgICAgICAw
ICAgICAgICAwICAgICAgICAwICAgNDkxNTE5ODk3ICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAg
ICAgICAgWQ0KICAgICAgICAgICAgIGRpdjRfbXV4ICAgICAgICAgICAgICAgICAwICAgICAgICAw
ICAgICAgICAwICAgNDkxNTE5ODk3ICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0K
ICAgICAgICAgICAgICAgIGRpdjQgICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAw
ICAgIDEyMjg3OTk4ICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAg
ICAgIGRpdjNfbXV4ICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgNDkxNTE5
ODk3ICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgICAgICAgIGRp
djMgICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDEyMjg3OTk4ICAgICAg
ICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgICAgICAgICAgIGRpZmYyX211
eCAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDEyMjg3OTk4ICAgICAgICAgIDAgICAg
IDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgICAgICAgICAgICAgIGRpZmYyICAgICAgICAg
ICAwICAgICAgICAwICAgICAgICAwICAgIDEyMjg3OTk4ICAgICAgICAgIDAgICAgIDAgIDUwMDAw
ICAgICAgICAgWQ0KDQpDaGVlcnMsDQpCaWp1DQo=
