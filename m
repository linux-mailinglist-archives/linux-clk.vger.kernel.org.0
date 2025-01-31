Return-Path: <linux-clk+bounces-17550-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46DEA23913
	for <lists+linux-clk@lfdr.de>; Fri, 31 Jan 2025 04:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EBEB1889AB6
	for <lists+linux-clk@lfdr.de>; Fri, 31 Jan 2025 03:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B284315E;
	Fri, 31 Jan 2025 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="ewBVehg3"
X-Original-To: linux-clk@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2118.outbound.protection.outlook.com [40.107.215.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383328EC;
	Fri, 31 Jan 2025 03:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738295486; cv=fail; b=E7G6yuUkUTK3M8VDci/JAKQiXibXPlb5dNKBt4R29aLYGVkoJu7CGY+3cxt7R1SSTA+IYQ51tdmZTY/zaf0qfXwR37j+MR4cemMDo7yjvFfygoBH+4fZU3XzjP4pOx5BiWSKsIP/+4c3emADjWycDaKQ3QOzL4dWVmkhzwzSEYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738295486; c=relaxed/simple;
	bh=U33jYAcVacAA4lASJW+1OjO0yYPHmXnlO3zb1cOxpXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qkl7LaaZ66C9S14NRms9WCTBIDX1kmmCjhYHLGXh+MaqJFn26CfOejjSfvH0022bFbiwKKr/dgcY+xnLtNulUSh0El/T3AbMEbNxUcgspKaiO3rq9MUEmNTwrvINDOmcayo0M92eoLLb1S3Ogtxe9h92oclIafOuBeEPmJkH+g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=ewBVehg3; arc=fail smtp.client-ip=40.107.215.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6zDU++KuQsoE20u8AsA+009BqEZF8mxkQNcT1Go/emZTIbP6SN0I15X9XG1kx/qhqzyAjNDR4inMPKV346brmbeRqc0K64mvNeJFYhAUmnKyIJ9pAYo8ZKBzKIyYDJuYKyfAMu1lp7woPBZGHUJGlUME1nixzyGrepjFI4c6BZeTLnGTXMibfIcAFBRg++hsaVPtxe1rhBuHr9bBD+PC8U9tJfQT2vPSCR6tTCr70o6D3+TGLtLxyRfWbpGseGSM4R4sej8fuok8ETJeVXm1zg6idWgDNviSJ5IhhpasuddK+yoOXWII0J9gcZQQc/v4TjKhlYFOA6CXDzhLBNv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U33jYAcVacAA4lASJW+1OjO0yYPHmXnlO3zb1cOxpXE=;
 b=ouWw57lWajNHw2au0MI//nAG/Fb2yPddb5J1S2TGLiEhbTTazRGmCeYjLQwBSZxwUATQpKZkAJeBSchZPGP+Bn2WLwz9v3ufM7Sk6ZNYhCxyFIAFP5WlxktQAOXWrCCz8DxfyDfSeGqACBx0bVoS4IIYkr9Qku/pEj0octmAIrb/uI3Wu2vOuD+t87LB1worwRuW/RLiPs7sz2Prtidx6PNkBty8P/nmFWKD/205FD27QVIm8I+08kt7YKYWOumaLdPAj4c6PbI4V+ynu6mN+Da77kjR13+0ro06Qqlxki8zmYRhPN/ZI0NomOB41d03j/7k6LvgZXs/rCQvYxHkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U33jYAcVacAA4lASJW+1OjO0yYPHmXnlO3zb1cOxpXE=;
 b=ewBVehg3Gxo6udpFHmm4VlGJ/IoMsgn7WQqqkUiAD2f06EQPtg3Kz9QDX3Cofv7m4M9M7pnvMJBd/NSjXq2KPTYBslVjpOZw0i0a/izjOnUyPsCkx5vr2CllI26RcJPYlV17iieBmLgFZIb5V5CS+mzo7pBzSgCHtPL1UGqexjlC4U5I3Xqyuu7+DvRJAP6tou2jEQRu4urxQ5WfJowA2Hl6F3ya2nqvHVxjmY66Uy5H2TwYdpBHbb3Vi/gNpcXNMLpJLgsNzCtRp6XwtFOd3zAOQtRXat7zKZ/nNC4pFdRMgEWgx5iSxz09I2CU9fZXzyqUaOUOFF7ucO0fpm+Bow==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by JH0PR06MB7177.apcprd06.prod.outlook.com (2603:1096:990:9b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.14; Fri, 31 Jan
 2025 03:51:16 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%4]) with mapi id 15.20.8398.014; Fri, 31 Jan 2025
 03:51:16 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: (subset) [PATCH v6 1/3] dt-bindings: mfd: aspeed: support for
 AST2700
Thread-Topic: (subset) [PATCH v6 1/3] dt-bindings: mfd: aspeed: support for
 AST2700
Thread-Index: AQHbJSo35P/BmRLgIU6SdF4s0TdcdrKip1gAgI4zhZA=
Date: Fri, 31 Jan 2025 03:51:15 +0000
Message-ID:
 <OS8PR06MB75417CF1E84556D1492EADF4F2E82@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241023090153.1395220-1-ryan_chen@aspeedtech.com>
 <20241023090153.1395220-2-ryan_chen@aspeedtech.com>
 <173047754439.1930424.6922132618537420144.b4-ty@kernel.org>
In-Reply-To: <173047754439.1930424.6922132618537420144.b4-ty@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|JH0PR06MB7177:EE_
x-ms-office365-filtering-correlation-id: 871d53a7-6a23-4f02-f7cc-08dd41aa8357
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2M1SnFKMENSeWJiUzljWTVhUzRUaW5HR0hCOUxWM3dwOVdteERQVWw5Y3RN?=
 =?utf-8?B?QXVISHZJd29VbmJ4bU9DZitXeit1ZnhjWVEydG1NNHhLUDVVMjlyMHVBaXla?=
 =?utf-8?B?Y0plMDVma1J2bXhRYU9UTm45cHNlR3pLb1hxWDVuMWhReVBwWmZMZVpmRlpy?=
 =?utf-8?B?enJVaExER01iOVNGU3dKT1A2Tmxna21pWjRqcE55eUJ5NUVXMkFBQUFhSVJn?=
 =?utf-8?B?V0p5T2hOZWxzWE5EYWhGUkRMQVhKVERwMTh3TFNLaFlNRWJPUGRJa04yVUU1?=
 =?utf-8?B?SXE5Q0RqVVdWNTA0cHZneTUwT2YrV2JwUXF1K1p2S1VKMEdWVkp1ZDJndFpE?=
 =?utf-8?B?S1dIL0g1K2lzOFhrZHhCWUVaSVZldXNzVVFVMlJKa0FFU3Vpek80VXVzY3V4?=
 =?utf-8?B?ZVhXcGlEdU9OMkduS1lTL2dEbnBYRllocEliV2FZd3l4SEpJQWFxTzJocXND?=
 =?utf-8?B?bk55T2RiY1Jxd1dYT09ldGlzUnZ1YnhHSVRwR0swSkhYZHFaeEgySStIRFlp?=
 =?utf-8?B?eXBXRmJ3bks3SS9WTlJQM3hUMVNoeXhMSWJnNDBNc3RJRG5ZT29QQVpzbllZ?=
 =?utf-8?B?aSsvZFM4L3BldFhENjAveGFZQTlqSjBFR3VrVndMMFU0UkE2bDlidnllY1Bl?=
 =?utf-8?B?dDEzVFVRRmFYMGVqdmRTRHJ1Y2VjZTAwSjdKVDMweXZOZWlrbmFPamxsb3hR?=
 =?utf-8?B?VzRFalArZk1ZNUFrWnVQajNQK0o0TTZObzAwc1FoWnFVUkh2VWk2NGw4b1pW?=
 =?utf-8?B?dlp0cDJyZEQ4MktTTmprMHFXTFRRS3hDRGQ5akFTdG9qTTFSYkhUcVVlbUhM?=
 =?utf-8?B?WUhIVldPMktFek1lZEIxd0crUmJ1dVF1S3dQODdXbTRjMXZYLzBlemF4VFUv?=
 =?utf-8?B?TlBrUFNjQ3RPWm5OczFMRWJTU1VjaEgwVSt1SUQ4LzlxbW4vcUwrRm5iZFdq?=
 =?utf-8?B?K2Y2TEVZN2RkWmtvTE5haWtOZXZkcWJ4dzVsMFBRVmxwbElzMWNHNmJYYjUw?=
 =?utf-8?B?cUs1OStnb1VGZzRUWjRhMmp3NE9RRVVZSnE5RGkrbmkrUWhzVzd5dkdxQ2pH?=
 =?utf-8?B?TXVOdGJiUVQxT2hTejFGMVcybnFpUmQwandJTGIweWpyWU1OMGQ5RVN1Znk4?=
 =?utf-8?B?SmcrVVZXSkFselV0QUsrbXhmSU5yNzVaQnV4WnZIOE83NXEzRzJsQ2hNYk5q?=
 =?utf-8?B?RWRQR1pRUVdiYURUUWpWTkZ3bHlaMTl3Q2k2OTkzZkNUMkxTdklVVkdmWDIv?=
 =?utf-8?B?NjB0a0l5ajZuamRtdm1hYUsrRWhtdFhwRlRzd015eVlQaXRSWmhNNys5amZQ?=
 =?utf-8?B?TmkwUjh5emtsck5HQS9yeXpkNWMrMjBYWExST2tkQTlHVHF1dGszdktUMmxJ?=
 =?utf-8?B?U2picnFtNmpHWGV3YXllZTVjclVOckptZXhGcTZVRk9jM2Nad3pVbE45anF3?=
 =?utf-8?B?VW5sMWs1RzdVWktuc3dJS09GNlFkbFlPdjJyS0hEcUhGYWovTXBXQnlzbHpw?=
 =?utf-8?B?VW5YZnlIU3B4WFdxS21qUk53M3NBMGdVRDJLMnVyRVIxeGg5aEduL3NOVmk3?=
 =?utf-8?B?Rzh4L01IZDAwTmk3aFA4NityTFFNQmJNeUFNRHpLSUQrTnVlMHRhRkFmOWdi?=
 =?utf-8?B?N2swR3NBVkRiS3pEWmxvZHRKTmpxbHkvN1VpYm9VY0hhVlA2MFprdU9BNjgy?=
 =?utf-8?B?UDNCZ292eSsrWnhqWlI1di9EcEc3N1N3YW53ODZtQVZuMUg1N0IzRkdsM1dW?=
 =?utf-8?B?NzNwUUlXTzgzSS9MWDlRMDJFU3BhZml6c2EwbkwrdkRJSkV6Uzg2NDVvSVNM?=
 =?utf-8?B?a21xYTMxb05vb0xaV3ZaUm9XTTNZdXV0Y2RmLytsUER3RXp1U3ZkZWZKWWMx?=
 =?utf-8?B?MDlYdkdqSnV1M2tJZk9sK0JhaHBZSlMrcXJ1ZXZ2UENYTjFvK2NqTTdVdnJF?=
 =?utf-8?B?ak5SelFPb25ScHYva2p1T0VkTmNhTlNwRW9NUzl4dklRem9CQVJOQWxKRXNw?=
 =?utf-8?B?KytORFM5N0JnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TG8vT1RWVjl0SCtBa1p6RGFaOWRzK1RKMXpOY3hCTXhSZ0R2TStZZVo3UVkw?=
 =?utf-8?B?cHlsbUpxbFZoQUVBdmpvSFIxSCswdk9oSXhqNWEwaXVONFNQSHg3c1YxNG9i?=
 =?utf-8?B?YWFRSHJkZldVbkJhMU42OGJkQjBGYTE4UTk2SU9ZZ3RvQjE5WGhWOHQrWnJw?=
 =?utf-8?B?OXVscTNnSVc1ZWpLU014Y0JKYnVNU0NLZE1lN2E3WlhNTTdWYmNvK3E2ZjR5?=
 =?utf-8?B?RjdheStoS1RSdnM2Sk1McW82RmpoR09lUUI5WU9vOXF0a216SkVES29ob3Vr?=
 =?utf-8?B?UURpN0hGcFhlWWFZcGFPWStTS3lGVGExU2Fob2hNWFRBbXRIL0FWNnQ5bUZn?=
 =?utf-8?B?bkl1VXZhNTlLWm9CVFBxbjBtaHdrREl3a05NTUFlR0lzd2JJUXJIREtlTVRs?=
 =?utf-8?B?MHFxeldlaVhKc0pPWWRweVhyOGhKM1lZaE1XbFlNSkF4clI1SG9WeTJLdDh5?=
 =?utf-8?B?K3VsVGlzWDdHaFlFV0dpZy9SUjdnWElyTEZIUWhoMHFwZzZHeFUyTnhic2Z0?=
 =?utf-8?B?NzUvN0RxUUNhaDM4cDltMVVOZVJkSExyamk1T2R6UmcrVU1uWXZoNmVMZG1Q?=
 =?utf-8?B?OTlCbWdEU0YyKzdFNENTSTZpSTRscjc4S1l0U0Y0RThvYTdWUHZ4cHIvcElP?=
 =?utf-8?B?RmcyQlFwenkyeXhWOS8xUkRsSGpob2ZZeG9MamhMTE1Oeis2L0NkV2h4RW00?=
 =?utf-8?B?RytMRkZYcHBjYjk4S0R1VzVXOU0yUmdiZWlnRkpnaE05VU1jQzdFN240VnZG?=
 =?utf-8?B?TVJBbTBGa2x1bnd2b3V0aS9Sa052c1J2VHdjMW5IL2Y4eHh6K2VQeXBXMmlM?=
 =?utf-8?B?TWdQY25YVXc2SVZqQUdwa0hmN3JVSkxPQzAxMVp6aGY5RHdraDhZWVNzK2R4?=
 =?utf-8?B?U1NrNjR1SGdHQ2x4ZFkrcXB6VFdnTWc3Q0JhTXRjWGpsbkhNZTF6Y3l5UjFs?=
 =?utf-8?B?Wlp2OFJ2M25LamNuMzRqcmRDd1B1NFNub3NvUjNpenVKanljNjE5SzJaWnVn?=
 =?utf-8?B?N0xBaUYyQ3JOb2RmR3doTWxBYUl3bE1WWE9sSVpvbDIzelJrY3VsS0paQy9O?=
 =?utf-8?B?NnFaUi9jSkUybnhmcUhOT1NGUXJ3SXE3QzZGbXVoZW9ua2NRMDBDZ2VVMWM5?=
 =?utf-8?B?T204amJsbEtMS0R5NHFxckIzK0tnMEVjc05HVUhNUkEreWY5Vk50MDlXT3hj?=
 =?utf-8?B?Z0UzOStBUXRqZjVlTFA1N3FXb2N3dXRjQklsRW9QY2JEbFF0aFNLYTVHeDZn?=
 =?utf-8?B?UVJLeU9lTEpUWHBBZU9wQUtjL3EzYmJoN2o0ZFk1cVJFWnFVd2srd09pNGV5?=
 =?utf-8?B?NEFVZnB5d1NOZis4YXJBRUhBQWJVTGZZNFBtNVZkOHppc0sxSGxWZUpXNEdm?=
 =?utf-8?B?Z3FnZ0Y3V0lOM1JVNEt5Z0ZEVTVqdXl2R01vRmNhQ2VIUldBK0RYQzViMmZl?=
 =?utf-8?B?UjhDcGpqejJRLzlweUF0U0JIWHVtN2VXQVB5TVVRaGlic1NhaUtKMmI2VGNq?=
 =?utf-8?B?U3QvZTBWNHRyYi9yRUJnRGFmOGdMY3dUaDd4RkhwUndybElCQnN3c053U2JS?=
 =?utf-8?B?VGIxM3QwS0x5U1E0R050UHJycGVaUDlTK3VhcmhJMjhFSW9WcUptaDV1TmFz?=
 =?utf-8?B?U280YWEzTG96MUpLdUV1WVJ1NTBjR0s4a1A0RnYwWFU1UzV0SU9jeXhzUTNE?=
 =?utf-8?B?MGp0Z0xVTHNlYlQ0dXVJRlJBK0laU1JSWStXUzdmMU83dWdQdzlObndNcWhN?=
 =?utf-8?B?TVZpdFhGaEtpRjE2NzZzUURCeCsrdnBXdk03cjBpRnFRcTZqdUsvYU1xNGg2?=
 =?utf-8?B?NERZanpHckk4SVp1VkNHeDRuQWdXSXhablNWWWdDaG1EME4xZGVjNVgydzJS?=
 =?utf-8?B?cGxXTm90bk9ScGJuYTNBcDhsSGE3RmFYbFFjNE9LYXVOdEZFVFVPTmJUajhV?=
 =?utf-8?B?SW9HRFNuYno4MzRSK3h1ck03R0JaVzVHT0kzRTZXVmFRQk1yaDh1OUkyYlBm?=
 =?utf-8?B?Zm1GZUFjRTR5Y1BzZk9iaitGUGRFUC9BWXo0WHdLR1ErT281WTE1S3BLTTJk?=
 =?utf-8?B?NFExMC8xTWUweVpuT01VRmt5NWEyTUxkZTJnNnN4VTZMQ3N3RDVNc2dsZStp?=
 =?utf-8?Q?IKSqXxildCsEeT4flLuNqvvk2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871d53a7-6a23-4f02-f7cc-08dd41aa8357
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 03:51:16.0025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /GrjuQzA3XjkX4agVbhVDaGI9xaKA4sTeR4eZfJD1WLj6CtF9Vqx4Jj8HM8Ld6WNzfgdyElWH2GWXwTyLudMtjEAuRco54TAWehlUvoFEsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7177

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWUgSm9uZXMgPGxlZUBrZXJu
ZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTm92ZW1iZXIgMiwgMjAyNCAxMjoxMiBBTQ0KPiBU
bzogbGVlQGtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0K
PiBjb25vcitkdEBrZXJuZWwub3JnOyBqb2VsQGptcy5pZC5hdTsgYW5kcmV3QGNvZGVjb25zdHJ1
Y3QuY29tLmF1Ow0KPiBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgc2JveWRAa2VybmVsLm9yZzsg
cC56YWJlbEBwZW5ndXRyb25peC5kZTsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3Rz
Lm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWNsa0B2
Z2VyLmtlcm5lbC5vcmc7IGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsgUnlhbiBDaGVuDQo+
IDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiAoc3Vic2V0KSBbUEFUQ0ggdjYgMS8zXSBk
dC1iaW5kaW5nczogbWZkOiBhc3BlZWQ6IHN1cHBvcnQgZm9yDQo+IEFTVDI3MDANCj4gDQo+IE9u
IFdlZCwgMjMgT2N0IDIwMjQgMTc6MDE6NTEgKzA4MDAsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBB
ZGQgcmVzZXQsIGNsayBkdCBiaW5kaW5ncyBoZWFkZXJzLCBhbmQgdXBkYXRlIGNvbXBhdGlibGUg
c3VwcG9ydCBmb3INCj4gPiBBU1QyNzAwIGNsaywgc2lsaWNvbi1pZCBpbiB5YW1sLg0KPiA+DQo+
ID4NCj4gDQo+IEFwcGxpZWQsIHRoYW5rcyENCj4gDQo+IFsxLzNdIGR0LWJpbmRpbmdzOiBtZmQ6
IGFzcGVlZDogc3VwcG9ydCBmb3IgQVNUMjcwMA0KPiAgICAgICBjb21taXQ6IDc2YzYyMTdjMzEy
NjZlODAwYjY3YTQ3NmJiYTU5ZGZlYjk4NThhOTANCj4gDQo+IC0tDQo+IExlZSBKb25lcyBb5p2O
55C85pavXQ0KDQpIZWxsbywNClNpbmNlIHRoaXMgcGF0Y2ggaGF2ZSBiZWVuIGFwcGxpZWQsIGlm
IEkgc3RpbGwgd2FudCBtb2RpZnkgSSB3aWxsIGRvIHRoZSByZWJhc2UgYW5kIHN0aWxsIHBhdGNo
IGJhc2Ugb24gdGhpcy4NCkFtIEkgcmlnaHQ/DQoNCkZvciBleGFtcGxlIEkgd2FudCB0byBtb2Rp
ZnkgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hc3BlZWQsYXN0MjcwMC1zY3UuaA0KSSBzZW5k
IHRoZSBwYXRjaHY4IFsxLzNdIHBhdGNoIGZvciBhc3BlZWQsYXN0MjcwMC1zY3UuaA0KT3RoZXJz
IFsyLzNdLCBbMy8zXSBzdGlsbCBwcm9ncmVzcywgYW0gSSByaWdodD8NCg0KT3IgSSBzaG91bGQg
Z28gZm9yIG5ldyBwYXRjaCBzZXJpZXM/DQoNClJ5YW4NCg==

