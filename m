Return-Path: <linux-clk+bounces-7339-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F18D1FE3
	for <lists+linux-clk@lfdr.de>; Tue, 28 May 2024 17:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CE58B22D15
	for <lists+linux-clk@lfdr.de>; Tue, 28 May 2024 15:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8140E171670;
	Tue, 28 May 2024 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="lZ2e+Jqf"
X-Original-To: linux-clk@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2066.outbound.protection.outlook.com [40.107.7.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673B1171658;
	Tue, 28 May 2024 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716909070; cv=fail; b=bumPOSPK47yAMONIAaHgNjNqlhskEZq0UYsYkiyIu5TR0YUtsRKJAQ08QeNmZrtHF5N4IOZLBW7BK0pq3+8ygs0y6iJv6AzEq450WVCgKUuQzqNU1jDlidYgrRf64z8E+Z4KmkhJMiCZ2NB39F0l5gy073TCZ+OzqOzrcfVhYWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716909070; c=relaxed/simple;
	bh=YsITFlDFa76+9e8XlDHUBe01wFyTH29ivmiSATYPlxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cBSa1AJA0XdvfdX5U1jat5hC3ZLgjk94jhr2GZ89Es6ECDen0OPMD8AIgMavrrixrsCh6RndeyUjZi5UwS2IvmHI5gFq6jLehqdS0LuB7cxPCwFXzyVXeyQlk1cLnaas2S7JWMwPFK80igj+6gY42Dj/Dw/KCFFCwSviYv9Iox8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=lZ2e+Jqf; arc=fail smtp.client-ip=40.107.7.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgV0bte9cO4azNbtdx53e2doOeY3qbzPDh/lJj463RQQ9p0JGfJ920iQLpMNkN0WrCvyxDw89WJdTk2Kl7MQeKg0y0A8ZRmh46vkUnfECM9OO02UbrYdiix1jc+X8ceIj2zgDT/GNQTTAKNHUF6vL2VxtC97134RBfITv6SN8LR8OjhfU6PsPivwutvA+HxWb/5AfMEHLgk5qqRfE/CfI701SOH6G/sDvfuVbAxh3YTyOv3+VkuKkEC7MPYO/PkOheNcnWavINKyJBHXYHyRq2umm1nxHDMp45KgXztgE7uI+vS0AYBTTot43DYZPPFz+tuZZnY7UjFvzd0SuXVB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pm6rmQ/wFTfV6qghcdxwUIiTp0GKNeUT+Qfnqxo5Q04=;
 b=UgUrRym2yHzhQBWAynCiNfRsZasX0TevVudGPcjEM+unM4RfZ0guO1Itv7wjbLmXjWcIaTL3qM7DI0OtNRFhD6+IkOcm/n96UJTTTe0Vn+dmXl3k9kDEAQpMNuXhc6D+nDrWpjSV/Dk3PvTEftYIFFLV3iEYaGusQG28YhcuK1cjr3AdxC5e0ikxHs0VS1iXaiJpnsKjf2DCSgT5cUNCl/92Ja4ODe91bomxqBz4y2rpgrfdrSeQ8WmnCtOmnk784RG4OaVN5YEcr7LrnajPfy33WX7t0WCnUY0A/0MoAGFQ7UkDf1f87dUiGfxkBR+u0tPDPALP8zhR7eAB3NmJYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pm6rmQ/wFTfV6qghcdxwUIiTp0GKNeUT+Qfnqxo5Q04=;
 b=lZ2e+Jqf5thV6yIsy7389mvlNNsResp0c3OV5ffGikumCDN8RUnu8k5NafN040nP5lZZevzwOaAaoETrSY1YLiWwkIVwqpsq3aDNncYoEQ8DJpYYtIXNbWFh2yEzSED7bL0MMTd3aVKR6RGnm2kaZRUxmT2pubaQA+SPCoNlZl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8904.eurprd04.prod.outlook.com (2603:10a6:10:2e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 15:11:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 15:11:02 +0000
Date: Tue, 28 May 2024 11:10:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, ping.bai@nxp.com, ye.li@nxp.com,
	peng.fan@nxp.com, aisheng.dong@nxp.com, tharvey@gateworks.com,
	alexander.stein@ew.tq-group.com, gregor.herburger@ew.tq-group.com,
	hiago.franco@toradex.com, joao.goncalves@toradex.com,
	hvilleneuve@dimonoff.com, Markus.Niebel@ew.tq-group.com,
	m.felsch@pengutronix.de, m.othacehe@gmail.com, bhelgaas@google.com,
	leoyang.li@nxp.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] arm64: dts: freescale: Add i.MX91 dtsi support
Message-ID: <ZlXz+aF8fzv8Nrg8@lizhi-Precision-Tower-5810>
References: <20240527235158.1037971-1-pengfei.li_1@nxp.com>
 <20240527235158.1037971-4-pengfei.li_1@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527235158.1037971-4-pengfei.li_1@nxp.com>
X-ClientProxiedBy: BYAPR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::42) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: 01928cc6-96ff-466f-c12f-08dc7f286318
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230031|52116005|7416005|376005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Y8hb2P95yxTQ1gX65/VO1iIswC4PFWBKdHABSxT+yRmbmDphuK4CIOqEc9Pa?=
 =?us-ascii?Q?xeObD0mxn1FT3cPzOQw6CdNP0EujfvzWvNXTbTd2MdXeB22L8xfgtLdQlszJ?=
 =?us-ascii?Q?ReVasT9awQ5+CP31TnFKWE+SiP4B9v+nMgW5U/kabHvfVcV8Cexb+48gDtaP?=
 =?us-ascii?Q?M9iJ95hxX3/fcZjIFjTdVwIYgmDjz90i7LpZdc5smpO8lzzwoQ/E6xWhqhfr?=
 =?us-ascii?Q?sAyIo2UyKweuhPaAFSu+BhLESVp3kH5T8+tmHG8TNuwAJnXeYvSmcxnG/cUd?=
 =?us-ascii?Q?f/pktTTi4jgm2Z0rwMimfm/GLcM6nHUZ6qSxyCme7DAipSufiZdF+WwIprJz?=
 =?us-ascii?Q?B5r3CZKJaE79ARhYZc5vJl+kDMfWMRxpWc3va1vLqN8d55iDTWLJ3PfFojJr?=
 =?us-ascii?Q?Kv4k2HAYBXrcWeUuyBnCDKZh6/kCZ5s8IAcH4/tUri4OSOnDbC+1nfFO4mat?=
 =?us-ascii?Q?59OLqRt3x70BJidWE4vWYq+PEhq6e1UIMsnD6kxcC7dnb9EmzPg+n7PMSOBv?=
 =?us-ascii?Q?hSryW9zRRcZWg+S5bVudMVDFClPxJqYbJcgHfy3jlLFjy+Q2NoBoMiBPMLp/?=
 =?us-ascii?Q?OehkHIccajh6qEDGbAUd23T1YGgtT9aw690+MZi7EC6TwqujJoxELWEtdAu2?=
 =?us-ascii?Q?WEEAMsDedYrPMeyI7rmZdIRI1BolVQszA+/uLALetjzFx8zLWgx7AHTJZuyU?=
 =?us-ascii?Q?mWqojpXMJ5mV26AAksrTXN8oI1KUnRvrw7XgxGHcXObmh7j8tdiIHP4A030c?=
 =?us-ascii?Q?+7O6pvnrDqm6fN4sOykkpLy5o/E8wM0O04OeVZarNc3yYaqttgml/HN8Z0Oc?=
 =?us-ascii?Q?wqNIHXqrUZwLEDLtFOiS/3ev6pKoenIkvQtayfCvcFeINJUVRwYm1pq7M5s9?=
 =?us-ascii?Q?LIuCWY7ga3Fe3P+fOABsHp8gbePmE5xiWYrF70QuCZYnK6ai8de5U8I+k1DO?=
 =?us-ascii?Q?xPKrIPa2tq7IQcLUHpNkXTJ0uvcqM1Ke2jOIJXB14ZrN64XF7k+ghJ4c8ZCa?=
 =?us-ascii?Q?oNjZ1CbkSnJnAo+J0dwKSZWQwd1CrEeIP+os8cOk5D4BUm4WD6K987/BDv3Q?=
 =?us-ascii?Q?X2JIYx+9z35uZo89MBeLilPvkG6ZKT5UnE6z2e0hC4TXtk8qCn+/DdeQwiZ6?=
 =?us-ascii?Q?sqesTn36Pj9ggPNuOSYwUOz8moVUCslCWYQFyj0f2BSIC+kyBawr2qYUO0ag?=
 =?us-ascii?Q?zDvP4spDy7+qH9VB+pLxJZcrOmGCa6F0B1no9Eb/cTuVpbW1cfOa9yHOgDvZ?=
 =?us-ascii?Q?jlI++OmkkrlOCCYdEFra7B8iM1gcSjrBlV3DrvenLx2Cg646bWqSZeJP5Ssw?=
 =?us-ascii?Q?3lPMFb+r9Mp8wU+LcjX9HsFy?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Dlyb/keUmntvN5awdd5jXYiKYzJ6YS1hbzlcWegMD/csHJ5/n7os2RuCqqo/?=
 =?us-ascii?Q?2b8zGbem8OFM0XuzYflmgiZAB/VkIdQ4hXclyTzK/2lJuKY4Mv1ZGb70jrfC?=
 =?us-ascii?Q?d0/lKsd1uUbn5ivO6FatT5la6fzg13sfqY1GBiZHGFIyTj5UbOp8u/Y9Af4z?=
 =?us-ascii?Q?jkdkJhmlhiwkxgzxeBkUue6qHYLWWt5IdW1WRXa2wHNoSc7hqP/hZnn/8LzT?=
 =?us-ascii?Q?8wgHkzvbqQJBPQvrFHy2OkO6azxjdgfCo04snyUvEqNFz0J+rYIRp49qSoFI?=
 =?us-ascii?Q?7T7fTgVtg9fub+bgw1oy5/ti7QSVE5n3IYHA3C4TEsEOI6CANg5cy6vKiOXV?=
 =?us-ascii?Q?EEY/0FRJgwaONUwyWD2A7rwzzWGT9QV9e92Ix/mNE1K3v8gjhzwKEcbUZsWs?=
 =?us-ascii?Q?We4Sx9Y55GpTdG0NeKinM10CCzEwnkiR7blXCdRiogXboVpcblpjpML3/Hfl?=
 =?us-ascii?Q?9pN0S0FQT5RDay9ZlkEj/wnDoCqY8uze1lOWxObYcHdVg/gT2dFS3ZfgcwsH?=
 =?us-ascii?Q?/NHtQcr2TdOCbjMItMsFPleC/FZ9vQGhCfy+JHnZOdRJV5R5T34DsKYGltvd?=
 =?us-ascii?Q?zlYAIFgX3Dc6TTHsGySjSGy5lHk4kVRZeU9lZdOM1aQ37TFTU+E0Rj9rnHOx?=
 =?us-ascii?Q?3ZVbXUtO0WVEcLJt0WF6Ic5MsvwiWNF8Ci9IwVG97bzfK+JrImjW5S/hE9mA?=
 =?us-ascii?Q?dCsqGp5RQnkGcRHKPctJ7EgovX2Of4mmuwlDBmgOCUfjgILtQAVCXFZ6Egch?=
 =?us-ascii?Q?m6uoLmWf91V3DelmtuNK3xyp2svTongqLzUMMoV6bKNKPp6dAIrMALvtQqx4?=
 =?us-ascii?Q?FFAGs0iFbEwuH6E80dLUAZBV0tTlDmQKep1q7WK1NVUdIV9Bir9MYDkBYkz5?=
 =?us-ascii?Q?BbtZobwonU1fiuICYAScVVmZUyB00rd8pjy4Tcb5HKp/fGCF1/1eN3eVpoL+?=
 =?us-ascii?Q?waMbN8Zg7VPkJhxrXMfrpkT197TmsbDQqrzMRHmxZ3FCkaofA35kLjAMO4kR?=
 =?us-ascii?Q?UhHU534mHV5GhqpWumaRy/M6O0vR+uKwETHefBHUADjZBojrjMy/CaMIVu+v?=
 =?us-ascii?Q?69K6juUo+1H5cvipM9rn/vSgeIG1f4F55sH5JQ21LmeOYvGXIh3QPuiJoFIc?=
 =?us-ascii?Q?T49CcsnyaSRdbWvhkNgTGYnyC8HCEuByviRmm9pn7fdQHPv+pP5cZWIAj2hT?=
 =?us-ascii?Q?pMHzXd/2wU5XbX98Ho26OmF6ftYkVf4atcCJu14kShYPXL1zN5g1gE5zTfnm?=
 =?us-ascii?Q?xhKud/oGzFGEGe8iKrPTP9Bgq0gsfIW3813RX4sAEESTF0+K573SVkoSNOqY?=
 =?us-ascii?Q?OiL0hGgIKv8uam+FfyNyUSishNAUCwHPpy9FwXERJKB7eP1teKMHc3+o3Lwn?=
 =?us-ascii?Q?f50UPrIVJ9ccttfY6E488TMm0Trl1PNEI/pbAc1il/FNvJxxs77mLK3FrTSG?=
 =?us-ascii?Q?6PuHh9gwYU8lT0/iyh13jk5LybYMpSfx1GkAdQKCJhw4JY5P+Da2a3/PRNsP?=
 =?us-ascii?Q?EbalyxM+IS4lCXNj+wd9jVWBujfBjb+cCe9RDcdkVXVYm1iXArmk3/1yfhkf?=
 =?us-ascii?Q?Q9zMAk6uByIfdnj5PWs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01928cc6-96ff-466f-c12f-08dc7f286318
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 15:11:02.2192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqSXiY7DrV8mBOi4McZL4xZ3NqAFhbP4DxM7SqhBIfPGJNDmp3jSo2fklP8nk9/Gmuy/4ZP/uI3InnFouFsRGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8904

On Mon, May 27, 2024 at 04:51:56PM -0700, Pengfei Li wrote:
> The i.MX 91 family features an Arm Cortex-A55 running at up to
> 1.4GHz, support for modern LPDDR4 memory to enable platform longevity,
> along with a rich set of peripherals targeting medical, industrial
> and consumer IoT market segments.

Can you summary difference with imx93?

> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx91.dtsi      |  66 ++
>  2 files changed, 836 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx91-pinfunc.h b/arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> new file mode 100644
> index 000000000000..bc58ce2102b2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> @@ -0,0 +1,770 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __DTS_IMX91_PINFUNC_H
> +#define __DTS_IMX91_PINFUNC_H
> +
> +/*
> + * The pin function ID is a tuple of
> + * <mux_reg conf_reg input_reg mux_mode input_val>
> + */
> +#define MX91_PAD_DAP_TDI__JTAG_MUX_TDI                                           0x0000 0x01B0 0x03D8 0x00 0x00
> +#define MX91_PAD_DAP_TDI__MQS2_LEFT                                              0x0000 0x01B0 0x0000 0x01 0x00
> +#define MX91_PAD_DAP_TDI__CAN2_TX                                                0x0000 0x01B0 0x0000 0x03 0x00
> +#define MX91_PAD_DAP_TDI__FLEXIO2_FLEXIO30                                       0x0000 0x01B0 0x0000 0x04 0x00
> +#define MX91_PAD_DAP_TDI__GPIO3_IO28                                             0x0000 0x01B0 0x0000 0x05 0x00
> +#define MX91_PAD_DAP_TDI__LPUART5_RX                                             0x0000 0x01B0 0x0488 0x06 0x00
> +
> +#define MX91_PAD_DAP_TMS_SWDIO__JTAG_MUX_TMS                                     0x0004 0x01B4 0x03DC 0x00 0x00
> +#define MX91_PAD_DAP_TMS_SWDIO__FLEXIO2_FLEXIO31                                 0x0004 0x01B4 0x0000 0x04 0x00
> +#define MX91_PAD_DAP_TMS_SWDIO__GPIO3_IO29                                       0x0004 0x01B4 0x0000 0x05 0x00
> +#define MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B                                    0x0004 0x01B4 0x0000 0x06 0x00
> +
> +#define MX91_PAD_DAP_TCLK_SWCLK__JTAG_MUX_TCK                                    0x0008 0x01B8 0x03D4 0x00 0x00
> +#define MX91_PAD_DAP_TCLK_SWCLK__FLEXIO1_FLEXIO30                                0x0008 0x01B8 0x0000 0x04 0x00
> +#define MX91_PAD_DAP_TCLK_SWCLK__GPIO3_IO30                                      0x0008 0x01B8 0x0000 0x05 0x00
> +#define MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B                                   0x0008 0x01B8 0x0484 0x06 0x00
> +
> +#define MX91_PAD_DAP_TDO_TRACESWO__JTAG_MUX_TDO                                  0x000C 0x01BC 0x0000 0x00 0x00
> +#define MX91_PAD_DAP_TDO_TRACESWO__MQS2_RIGHT                                    0x000C 0x01BC 0x0000 0x01 0x00
> +#define MX91_PAD_DAP_TDO_TRACESWO__CAN2_RX                                       0x000C 0x01BC 0x0364 0x03 0x00
> +#define MX91_PAD_DAP_TDO_TRACESWO__FLEXIO1_FLEXIO31                              0x000C 0x01BC 0x0000 0x04 0x00
> +#define MX91_PAD_DAP_TDO_TRACESWO__GPIO3_IO31                                    0x000C 0x01BC 0x0000 0x05 0x00
> +#define MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX                                    0x000C 0x01BC 0x048C 0x06 0x00
> +
> +#define MX91_PAD_GPIO_IO00__GPIO2_IO0                                            0x0010 0x01C0 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO00__LPI2C3_SDA                                           0x0010 0x01C0 0x03F4 0x01 0x00
> +#define MX91_PAD_GPIO_IO00__MEDIAMIX_CAM_CLK                                     0x0010 0x01C0 0x04BC 0x02 0x00
> +#define MX91_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK                                    0x0010 0x01C0 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO00__LPSPI6_PCS0                                          0x0010 0x01C0 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO00__LPUART5_TX                                           0x0010 0x01C0 0x048C 0x05 0x01
> +#define MX91_PAD_GPIO_IO00__LPI2C5_SDA                                           0x0010 0x01C0 0x0404 0x06 0x00
> +#define MX91_PAD_GPIO_IO00__FLEXIO1_FLEXIO0                                      0x0010 0x01C0 0x036C 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO01__GPIO2_IO1                                            0x0014 0x01C4 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO01__LPI2C3_SCL                                           0x0014 0x01C4 0x03F0 0x01 0x00
> +#define MX91_PAD_GPIO_IO01__MEDIAMIX_CAM_DATA0                                   0x0014 0x01C4 0x0490 0x02 0x00
> +#define MX91_PAD_GPIO_IO01__MEDIAMIX_DISP_DE                                     0x0014 0x01C4 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO01__LPSPI6_SIN                                           0x0014 0x01C4 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO01__LPUART5_RX                                           0x0014 0x01C4 0x0488 0x05 0x01
> +#define MX91_PAD_GPIO_IO01__LPI2C5_SCL                                           0x0014 0x01C4 0x0400 0x06 0x00
> +#define MX91_PAD_GPIO_IO01__FLEXIO1_FLEXIO1                                      0x0014 0x01C4 0x0370 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO02__GPIO2_IO2                                            0x0018 0x01C8 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO02__LPI2C4_SDA                                           0x0018 0x01C8 0x03FC 0x01 0x00
> +#define MX91_PAD_GPIO_IO02__MEDIAMIX_CAM_VSYNC                                   0x0018 0x01C8 0x04C0 0x02 0x00
> +#define MX91_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC                                  0x0018 0x01C8 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO02__LPSPI6_SOUT                                          0x0018 0x01C8 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO02__LPUART5_CTS_B                                        0x0018 0x01C8 0x0484 0x05 0x01
> +#define MX91_PAD_GPIO_IO02__LPI2C6_SDA                                           0x0018 0x01C8 0x040C 0x06 0x00
> +#define MX91_PAD_GPIO_IO02__FLEXIO1_FLEXIO2                                      0x0018 0x01C8 0x0374 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO03__GPIO2_IO3                                            0x001C 0x01CC 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO03__LPI2C4_SCL                                           0x001C 0x01CC 0x03F8 0x01 0x00
> +#define MX91_PAD_GPIO_IO03__MEDIAMIX_CAM_HSYNC                                   0x001C 0x01CC 0x04B8 0x02 0x00
> +#define MX91_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC                                  0x001C 0x01CC 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO03__LPSPI6_SCK                                           0x001C 0x01CC 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO03__LPUART5_RTS_B                                        0x001C 0x01CC 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO03__LPI2C6_SCL                                           0x001C 0x01CC 0x0408 0x06 0x00
> +#define MX91_PAD_GPIO_IO03__FLEXIO1_FLEXIO3                                      0x001C 0x01CC 0x0378 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO04__GPIO2_IO4                                            0x0020 0x01D0 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO04__TPM3_CH0                                             0x0020 0x01D0 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO04__PDM_CLK                                              0x0020 0x01D0 0x0000 0x02 0x00
> +#define MX91_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA0                                  0x0020 0x01D0 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO04__LPSPI7_PCS0                                          0x0020 0x01D0 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO04__LPUART6_TX                                           0x0020 0x01D0 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO04__LPI2C6_SDA                                           0x0020 0x01D0 0x040C 0x06 0x01
> +#define MX91_PAD_GPIO_IO04__FLEXIO1_FLEXIO4                                      0x0020 0x01D0 0x037C 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO05__GPIO2_IO5                                            0x0024 0x01D4 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO05__TPM4_CH0                                             0x0024 0x01D4 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO05__PDM_BIT_STREAM0                                      0x0024 0x01D4 0x04C4 0x02 0x00
> +#define MX91_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA1                                  0x0024 0x01D4 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO05__LPSPI7_SIN                                           0x0024 0x01D4 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO05__LPUART6_RX                                           0x0024 0x01D4 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO05__LPI2C6_SCL                                           0x0024 0x01D4 0x0408 0x06 0x01
> +#define MX91_PAD_GPIO_IO05__FLEXIO1_FLEXIO5                                      0x0024 0x01D4 0x0380 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO06__GPIO2_IO6                                            0x0028 0x01D8 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO06__TPM5_CH0                                             0x0028 0x01D8 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO06__PDM_BIT_STREAM1                                      0x0028 0x01D8 0x04C8 0x02 0x00
> +#define MX91_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA2                                  0x0028 0x01D8 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO06__LPSPI7_SOUT                                          0x0028 0x01D8 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO06__LPUART6_CTS_B                                        0x0028 0x01D8 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO06__LPI2C7_SDA                                           0x0028 0x01D8 0x0414 0x06 0x00
> +#define MX91_PAD_GPIO_IO06__FLEXIO1_FLEXIO6                                      0x0028 0x01D8 0x0384 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO07__GPIO2_IO7                                            0x002C 0x01DC 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO07__LPSPI3_PCS1                                          0x002C 0x01DC 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO07__MEDIAMIX_CAM_DATA1                                   0x002C 0x01DC 0x0494 0x02 0x00
> +#define MX91_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA3                                  0x002C 0x01DC 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO07__LPSPI7_SCK                                           0x002C 0x01DC 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO07__LPUART6_RTS_B                                        0x002C 0x01DC 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO07__LPI2C7_SCL                                           0x002C 0x01DC 0x0410 0x06 0x00
> +#define MX91_PAD_GPIO_IO07__FLEXIO1_FLEXIO7                                      0x002C 0x01DC 0x0388 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO08__GPIO2_IO8                                            0x0030 0x01E0 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO08__LPSPI3_PCS0                                          0x0030 0x01E0 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO08__MEDIAMIX_CAM_DATA2                                   0x0030 0x01E0 0x0498 0x02 0x00
> +#define MX91_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA4                                  0x0030 0x01E0 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO08__TPM6_CH0                                             0x0030 0x01E0 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO08__LPUART7_TX                                           0x0030 0x01E0 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO08__LPI2C7_SDA                                           0x0030 0x01E0 0x0414 0x06 0x01
> +#define MX91_PAD_GPIO_IO08__FLEXIO1_FLEXIO8                                      0x0030 0x01E0 0x038C 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO09__GPIO2_IO9                                            0x0034 0x01E4 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO09__LPSPI3_SIN                                           0x0034 0x01E4 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO09__MEDIAMIX_CAM_DATA3                                   0x0034 0x01E4 0x049C 0x02 0x00
> +#define MX91_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA5                                  0x0034 0x01E4 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO09__TPM3_EXTCLK                                          0x0034 0x01E4 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO09__LPUART7_RX                                           0x0034 0x01E4 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO09__LPI2C7_SCL                                           0x0034 0x01E4 0x0410 0x06 0x01
> +#define MX91_PAD_GPIO_IO09__FLEXIO1_FLEXIO9                                      0x0034 0x01E4 0x0390 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO10__GPIO2_IO10                                           0x0038 0x01E8 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO10__LPSPI3_SOUT                                          0x0038 0x01E8 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO10__MEDIAMIX_CAM_DATA4                                   0x0038 0x01E8 0x04A0 0x02 0x00
> +#define MX91_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA6                                  0x0038 0x01E8 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO10__TPM4_EXTCLK                                          0x0038 0x01E8 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO10__LPUART7_CTS_B                                        0x0038 0x01E8 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO10__LPI2C8_SDA                                           0x0038 0x01E8 0x041C 0x06 0x00
> +#define MX91_PAD_GPIO_IO10__FLEXIO1_FLEXIO10                                     0x0038 0x01E8 0x0394 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO11__GPIO2_IO11                                           0x003C 0x01EC 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO11__LPSPI3_SCK                                           0x003C 0x01EC 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO11__MEDIAMIX_CAM_DATA5                                   0x003C 0x01EC 0x04A4 0x02 0x00
> +#define MX91_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA7                                  0x003C 0x01EC 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO11__TPM5_EXTCLK                                          0x003C 0x01EC 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO11__LPUART7_RTS_B                                        0x003C 0x01EC 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO11__LPI2C8_SCL                                           0x003C 0x01EC 0x0418 0x06 0x00
> +#define MX91_PAD_GPIO_IO11__FLEXIO1_FLEXIO11                                     0x003C 0x01EC 0x0398 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO12__GPIO2_IO12                                           0x0040 0x01F0 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO12__TPM3_CH2                                             0x0040 0x01F0 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO12__PDM_BIT_STREAM2                                      0x0040 0x01F0 0x04CC 0x02 0x00
> +#define MX91_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA8                                  0x0040 0x01F0 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO12__LPSPI8_PCS0                                          0x0040 0x01F0 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO12__LPUART8_TX                                           0x0040 0x01F0 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO12__LPI2C8_SDA                                           0x0040 0x01F0 0x041C 0x06 0x01
> +#define MX91_PAD_GPIO_IO12__SAI3_RX_SYNC                                         0x0040 0x01F0 0x04DC 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO13__GPIO2_IO13                                           0x0044 0x01F4 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO13__TPM4_CH2                                             0x0044 0x01F4 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO13__PDM_BIT_STREAM3                                      0x0044 0x01F4 0x04D0 0x02 0x00
> +#define MX91_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA9                                  0x0044 0x01F4 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO13__LPSPI8_SIN                                           0x0044 0x01F4 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO13__LPUART8_RX                                           0x0044 0x01F4 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO13__LPI2C8_SCL                                           0x0044 0x01F4 0x0418 0x06 0x01
> +#define MX91_PAD_GPIO_IO13__FLEXIO1_FLEXIO13                                     0x0044 0x01F4 0x039C 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO14__GPIO2_IO14                                           0x0048 0x01F8 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO14__LPUART3_TX                                           0x0048 0x01F8 0x0474 0x01 0x00
> +#define MX91_PAD_GPIO_IO14__MEDIAMIX_CAM_DATA6                                   0x0048 0x01F8 0x04A8 0x02 0x00
> +#define MX91_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10                                 0x0048 0x01F8 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO14__LPSPI8_SOUT                                          0x0048 0x01F8 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO14__LPUART8_CTS_B                                        0x0048 0x01F8 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO14__LPUART4_TX                                           0x0048 0x01F8 0x0480 0x06 0x00
> +#define MX91_PAD_GPIO_IO14__FLEXIO1_FLEXIO14                                     0x0048 0x01F8 0x03A0 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO15__GPIO2_IO15                                           0x004C 0x01FC 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO15__LPUART3_RX                                           0x004C 0x01FC 0x0470 0x01 0x00
> +#define MX91_PAD_GPIO_IO15__MEDIAMIX_CAM_DATA7                                   0x004C 0x01FC 0x04AC 0x02 0x00
> +#define MX91_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11                                 0x004C 0x01FC 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO15__LPSPI8_SCK                                           0x004C 0x01FC 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO15__LPUART8_RTS_B                                        0x004C 0x01FC 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO15__LPUART4_RX                                           0x004C 0x01FC 0x047C 0x06 0x00
> +#define MX91_PAD_GPIO_IO15__FLEXIO1_FLEXIO15                                     0x004C 0x01FC 0x03A4 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO16__GPIO2_IO16                                           0x0050 0x0200 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO16__SAI3_TX_BCLK                                         0x0050 0x0200 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO16__PDM_BIT_STREAM2                                      0x0050 0x0200 0x04CC 0x02 0x01
> +#define MX91_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12                                 0x0050 0x0200 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO16__LPUART3_CTS_B                                        0x0050 0x0200 0x046C 0x04 0x00
> +#define MX91_PAD_GPIO_IO16__LPSPI4_PCS2                                          0x0050 0x0200 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO16__LPUART4_CTS_B                                        0x0050 0x0200 0x0478 0x06 0x00
> +#define MX91_PAD_GPIO_IO16__FLEXIO1_FLEXIO16                                     0x0050 0x0200 0x03A8 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO17__GPIO2_IO17                                           0x0054 0x0204 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO17__SAI3_MCLK                                            0x0054 0x0204 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO17__MEDIAMIX_CAM_DATA8                                   0x0054 0x0204 0x04B0 0x02 0x00
> +#define MX91_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13                                 0x0054 0x0204 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO17__LPUART3_RTS_B                                        0x0054 0x0204 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO17__LPSPI4_PCS1                                          0x0054 0x0204 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO17__LPUART4_RTS_B                                        0x0054 0x0204 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO17__FLEXIO1_FLEXIO17                                     0x0054 0x0204 0x03AC 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO18__GPIO2_IO18                                           0x0058 0x0208 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO18__SAI3_RX_BCLK                                         0x0058 0x0208 0x04D8 0x01 0x00
> +#define MX91_PAD_GPIO_IO18__MEDIAMIX_CAM_DATA9                                   0x0058 0x0208 0x04B4 0x02 0x00
> +#define MX91_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14                                 0x0058 0x0208 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO18__LPSPI5_PCS0                                          0x0058 0x0208 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO18__LPSPI4_PCS0                                          0x0058 0x0208 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO18__TPM5_CH2                                             0x0058 0x0208 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO18__FLEXIO1_FLEXIO18                                     0x0058 0x0208 0x03B0 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO19__GPIO2_IO19                                           0x005C 0x020C 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO19__SAI3_RX_SYNC                                         0x005C 0x020C 0x04DC 0x01 0x01
> +#define MX91_PAD_GPIO_IO19__PDM_BIT_STREAM3                                      0x005C 0x020C 0x04D0 0x02 0x01
> +#define MX91_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15                                 0x005C 0x020C 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO19__LPSPI5_SIN                                           0x005C 0x020C 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO19__LPSPI4_SIN                                           0x005C 0x020C 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO19__TPM6_CH2                                             0x005C 0x020C 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO19__SAI3_TX_DATA0                                        0x005C 0x020C 0x0000 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO20__GPIO2_IO20                                           0x0060 0x0210 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO20__SAI3_RX_DATA0                                        0x0060 0x0210 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO20__PDM_BIT_STREAM0                                      0x0060 0x0210 0x04C4 0x02 0x01
> +#define MX91_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16                                 0x0060 0x0210 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO20__LPSPI5_SOUT                                          0x0060 0x0210 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO20__LPSPI4_SOUT                                          0x0060 0x0210 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO20__TPM3_CH1                                             0x0060 0x0210 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO20__FLEXIO1_FLEXIO20                                     0x0060 0x0210 0x03B4 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO21__GPIO2_IO21                                           0x0064 0x0214 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO21__SAI3_TX_DATA0                                        0x0064 0x0214 0x0000 0x01 0x00
> +#define MX91_PAD_GPIO_IO21__PDM_CLK                                              0x0064 0x0214 0x0000 0x02 0x00
> +#define MX91_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17                                 0x0064 0x0214 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO21__LPSPI5_SCK                                           0x0064 0x0214 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO21__LPSPI4_SCK                                           0x0064 0x0214 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO21__TPM4_CH1                                             0x0064 0x0214 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO21__SAI3_RX_BCLK                                         0x0064 0x0214 0x04D8 0x07 0x01
> +
> +#define MX91_PAD_GPIO_IO22__GPIO2_IO22                                           0x0068 0x0218 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO22__USDHC3_CLK                                           0x0068 0x0218 0x04E8 0x01 0x00
> +#define MX91_PAD_GPIO_IO22__SPDIF_IN                                             0x0068 0x0218 0x04E4 0x02 0x00
> +#define MX91_PAD_GPIO_IO22__MEDIAMIX_DISP_DATA18                                 0x0068 0x0218 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO22__TPM5_CH1                                             0x0068 0x0218 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO22__TPM6_EXTCLK                                          0x0068 0x0218 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO22__LPI2C5_SDA                                           0x0068 0x0218 0x0404 0x06 0x01
> +#define MX91_PAD_GPIO_IO22__FLEXIO1_FLEXIO22                                     0x0068 0x0218 0x03B8 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO23__GPIO2_IO23                                           0x006C 0x021C 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO23__USDHC3_CMD                                           0x006C 0x021C 0x04EC 0x01 0x00
> +#define MX91_PAD_GPIO_IO23__SPDIF_OUT                                            0x006C 0x021C 0x0000 0x02 0x00
> +#define MX91_PAD_GPIO_IO23__MEDIAMIX_DISP_DATA19                                 0x006C 0x021C 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO23__TPM6_CH1                                             0x006C 0x021C 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO23__LPI2C5_SCL                                           0x006C 0x021C 0x0400 0x06 0x01
> +#define MX91_PAD_GPIO_IO23__FLEXIO1_FLEXIO23                                     0x006C 0x021C 0x03BC 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO24__GPIO2_IO24                                           0x0070 0x0220 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO24__USDHC3_DATA0                                         0x0070 0x0220 0x04F0 0x01 0x00
> +#define MX91_PAD_GPIO_IO24__MEDIAMIX_DISP_DATA20                                 0x0070 0x0220 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO24__TPM3_CH3                                             0x0070 0x0220 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO24__JTAG_MUX_TDO                                         0x0070 0x0220 0x0000 0x05 0x00
> +#define MX91_PAD_GPIO_IO24__LPSPI6_PCS1                                          0x0070 0x0220 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO24__FLEXIO1_FLEXIO24                                     0x0070 0x0220 0x03C0 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO25__GPIO2_IO25                                           0x0074 0x0224 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO25__USDHC3_DATA1                                         0x0074 0x0224 0x04F4 0x01 0x00
> +#define MX91_PAD_GPIO_IO25__CAN2_TX                                              0x0074 0x0224 0x0000 0x02 0x00
> +#define MX91_PAD_GPIO_IO25__MEDIAMIX_DISP_DATA21                                 0x0074 0x0224 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO25__TPM4_CH3                                             0x0074 0x0224 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO25__JTAG_MUX_TCK                                         0x0074 0x0224 0x03D4 0x05 0x01
> +#define MX91_PAD_GPIO_IO25__LPSPI7_PCS1                                          0x0074 0x0224 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO25__FLEXIO1_FLEXIO25                                     0x0074 0x0224 0x03C4 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO26__GPIO2_IO26                                           0x0078 0x0228 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO26__USDHC3_DATA2                                         0x0078 0x0228 0x04F8 0x01 0x00
> +#define MX91_PAD_GPIO_IO26__PDM_BIT_STREAM1                                      0x0078 0x0228 0x04C8 0x02 0x01
> +#define MX91_PAD_GPIO_IO26__MEDIAMIX_DISP_DATA22                                 0x0078 0x0228 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO26__TPM5_CH3                                             0x0078 0x0228 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO26__JTAG_MUX_TDI                                         0x0078 0x0228 0x03D8 0x05 0x01
> +#define MX91_PAD_GPIO_IO26__LPSPI8_PCS1                                          0x0078 0x0228 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO26__SAI3_TX_SYNC                                         0x0078 0x0228 0x04E0 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO27__GPIO2_IO27                                           0x007C 0x022C 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO27__USDHC3_DATA3                                         0x007C 0x022C 0x04FC 0x01 0x00
> +#define MX91_PAD_GPIO_IO27__CAN2_RX                                              0x007C 0x022C 0x0364 0x02 0x01
> +#define MX91_PAD_GPIO_IO27__MEDIAMIX_DISP_DATA23                                 0x007C 0x022C 0x0000 0x03 0x00
> +#define MX91_PAD_GPIO_IO27__TPM6_CH3                                             0x007C 0x022C 0x0000 0x04 0x00
> +#define MX91_PAD_GPIO_IO27__JTAG_MUX_TMS                                         0x007C 0x022C 0x03DC 0x05 0x01
> +#define MX91_PAD_GPIO_IO27__LPSPI5_PCS1                                          0x007C 0x022C 0x0000 0x06 0x00
> +#define MX91_PAD_GPIO_IO27__FLEXIO1_FLEXIO27                                     0x007C 0x022C 0x03C8 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO28__GPIO2_IO28                                           0x0080 0x0230 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO28__LPI2C3_SDA                                           0x0080 0x0230 0x03F4 0x01 0x01
> +#define MX91_PAD_GPIO_IO28__CAN1_TX                                              0x0080 0x0230 0x0000 0x02 0x00
> +#define MX91_PAD_GPIO_IO28__FLEXIO1_FLEXIO28                                     0x0080 0x0230 0x0000 0x07 0x00
> +
> +#define MX91_PAD_GPIO_IO29__GPIO2_IO29                                           0x0084 0x0234 0x0000 0x00 0x00
> +#define MX91_PAD_GPIO_IO29__LPI2C3_SCL                                           0x0084 0x0234 0x03F0 0x01 0x01
> +#define MX91_PAD_GPIO_IO29__CAN1_RX                                              0x0084 0x0234 0x0360 0x02 0x00
> +#define MX91_PAD_GPIO_IO29__FLEXIO1_FLEXIO29                                     0x0084 0x0234 0x0000 0x07 0x00
> +
> +#define MX91_PAD_CCM_CLKO1__CCMSRCGPCMIX_CLKO1                                   0x0088 0x0238 0x0000 0x00 0x00
> +#define MX91_PAD_CCM_CLKO1__FLEXIO1_FLEXIO26                                     0x0088 0x0238 0x0000 0x04 0x00
> +#define MX91_PAD_CCM_CLKO1__GPIO3_IO26                                           0x0088 0x0238 0x0000 0x05 0x00
> +
> +#define MX91_PAD_CCM_CLKO2__GPIO3_IO27                                           0x008C 0x023C 0x0000 0x05 0x00
> +#define MX91_PAD_CCM_CLKO2__CCMSRCGPCMIX_CLKO2                                   0x008C 0x023C 0x0000 0x00 0x00
> +#define MX91_PAD_CCM_CLKO2__FLEXIO1_FLEXIO27                                     0x008C 0x023C 0x03C8 0x04 0x01
> +
> +#define MX91_PAD_CCM_CLKO3__CCMSRCGPCMIX_CLKO3                                   0x0090 0x0240 0x0000 0x00 0x00
> +#define MX91_PAD_CCM_CLKO3__FLEXIO2_FLEXIO28                                     0x0090 0x0240 0x0000 0x04 0x00
> +#define MX91_PAD_CCM_CLKO3__GPIO4_IO28                                           0x0090 0x0240 0x0000 0x05 0x00
> +
> +#define MX91_PAD_CCM_CLKO4__CCMSRCGPCMIX_CLKO4                                   0x0094 0x0244 0x0000 0x00 0x00
> +#define MX91_PAD_CCM_CLKO4__FLEXIO2_FLEXIO29                                     0x0094 0x0244 0x0000 0x04 0x00
> +#define MX91_PAD_CCM_CLKO4__GPIO4_IO29                                           0x0094 0x0244 0x0000 0x05 0x00
> +
> +#define MX91_PAD_ENET1_MDC__ENET1_MDC                                            0x0098 0x0248 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_MDC__LPUART3_DCB_B                                        0x0098 0x0248 0x0000 0x01 0x00
> +#define MX91_PAD_ENET1_MDC__I3C2_SCL                                             0x0098 0x0248 0x03CC 0x02 0x00
> +#define MX91_PAD_ENET1_MDC__HSIOMIX_OTG_ID1                                      0x0098 0x0248 0x0000 0x03 0x00
> +#define MX91_PAD_ENET1_MDC__FLEXIO2_FLEXIO0                                      0x0098 0x0248 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_MDC__GPIO4_IO0                                            0x0098 0x0248 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_MDC__LPI2C1_SCL                                           0x0098 0x0248 0x03E0 0x06 0x00
> +
> +#define MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                                       0x009C 0x024C 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_MDIO__LPUART3_RIN_B                                       0x009C 0x024C 0x0000 0x01 0x00
> +#define MX91_PAD_ENET1_MDIO__I3C2_SDA                                            0x009C 0x024C 0x03D0 0x02 0x00
> +#define MX91_PAD_ENET1_MDIO__HSIOMIX_OTG_PWR1                                    0x009C 0x024C 0x0000 0x03 0x00
> +#define MX91_PAD_ENET1_MDIO__FLEXIO2_FLEXIO1                                     0x009C 0x024C 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_MDIO__GPIO4_IO1                                           0x009C 0x024C 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_MDIO__LPI2C1_SDA                                          0x009C 0x024C 0x03E4 0x06 0x00
> +
> +#define MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                                   0x00A0 0x0250 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_TD3__CAN2_TX                                              0x00A0 0x0250 0x0000 0x02 0x00
> +#define MX91_PAD_ENET1_TD3__HSIOMIX_OTG_ID2                                      0x00A0 0x0250 0x0000 0x03 0x00
> +#define MX91_PAD_ENET1_TD3__FLEXIO2_FLEXIO2                                      0x00A0 0x0250 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_TD3__GPIO4_IO3                                            0x00A0 0x0250 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_TD3__LPI2C2_SCL                                           0x00A0 0x0250 0x03E8 0x06 0x00
> +
> +#define MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                                   0x00A4 0x0254 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_TD2__ENET_QOS_CLOCK_GENERATE_CLK                          0x00A4 0x0254 0x0000 0x01 0x00
> +#define MX91_PAD_ENET1_TD2__CAN2_RX                                              0x00A4 0x0254 0x0364 0x02 0x02
> +#define MX91_PAD_ENET1_TD2__HSIOMIX_OTG_OC2                                      0x00A4 0x0254 0x0000 0x03 0x00
> +#define MX91_PAD_ENET1_TD2__FLEXIO2_FLEXIO3                                      0x00A4 0x0254 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_TD2__GPIO4_IO3                                            0x00A4 0x0254 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_TD2__LPI2C2_SDA                                           0x00A4 0x0254 0x03EC 0x06 0x00
> +
> +#define MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                                      0x00A8 0x0258 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_TD1__LPUART3_RTS_B                                        0x00A8 0x0258 0x0000 0x01 0x00
> +#define MX91_PAD_ENET1_TD1__I3C2_PUR                                             0x00A8 0x0258 0x0000 0x02 0x00
> +#define MX91_PAD_ENET1_TD1__HSIOMIX_OTG_OC1                                      0x00A8 0x0258 0x0000 0x03 0x00
> +#define MX91_PAD_ENET1_TD1__FLEXIO2_FLEXIO4                                      0x00A8 0x0258 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_TD1__GPIO4_IO4                                            0x00A8 0x0258 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_TD1__I3C2_PUR_B                                           0x00A8 0x0258 0x0000 0x06 0x00
> +
> +#define MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                                   0x00AC 0x025C 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_TD0__LPUART3_TX                                           0x00AC 0x025C 0x0474 0x01 0x01
> +#define MX91_PAD_ENET1_TD0__FLEXIO2_FLEXIO5                                      0x00AC 0x025C 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_TD0__GPIO4_IO5                                            0x00AC 0x025C 0x0000 0x05 0x00
> +
> +#define MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL                             0x00B0 0x0260 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_TX_CTL__LPUART3_DTR_B                                     0x00B0 0x0260 0x0000 0x01 0x00
> +#define MX91_PAD_ENET1_TX_CTL__FLEXIO2_FLEXIO6                                   0x00B0 0x0260 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_TX_CTL__GPIO4_IO6                                         0x00B0 0x0260 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_TX_CTL__LPSPI2_SCK                                        0x00B0 0x0260 0x043C 0x02 0x00
> +
> +#define MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK                   0x00B4 0x0264 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_TXC__ENET_QOS_TX_ER                                       0x00B4 0x0264 0x0000 0x01 0x00
> +#define MX91_PAD_ENET1_TXC__FLEXIO2_FLEXIO7                                      0x00B4 0x0264 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_TXC__GPIO4_IO7                                            0x00B4 0x0264 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_TXC__LPSPI2_SIN                                           0x00B4 0x0264 0x0440 0x02 0x00
> +
> +#define MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL                             0x00B8 0x0268 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_RX_CTL__LPUART3_DSR_B                                     0x00B8 0x0268 0x0000 0x01 0x00
> +#define MX91_PAD_ENET1_RX_CTL__HSIOMIX_OTG_PWR2                                  0x00B8 0x0268 0x0000 0x03 0x00
> +#define MX91_PAD_ENET1_RX_CTL__FLEXIO2_FLEXIO8                                   0x00B8 0x0268 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_RX_CTL__GPIO4_IO8                                         0x00B8 0x0268 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_RX_CTL__LPSPI2_PCS0                                       0x00B8 0x0268 0x0434 0x02 0x00
> +
> +#define MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                                   0x00BC 0x026C 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_RXC__ENET_QOS_RX_ER                                       0x00BC 0x026C 0x0000 0x01 0x00
> +#define MX91_PAD_ENET1_RXC__FLEXIO2_FLEXIO9                                      0x00BC 0x026C 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_RXC__GPIO4_IO9                                            0x00BC 0x026C 0x0000 0x05 0x00
> +#define MX91_PAD_ENET1_RXC__LPSPI2_SOUT                                          0x00BC 0x026C 0x0444 0x02 0x00
> +
> +#define MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                                   0x00C0 0x0270 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_RD0__LPUART3_RX                                           0x00C0 0x0270 0x0470 0x01 0x01
> +#define MX91_PAD_ENET1_RD0__FLEXIO2_FLEXIO10                                     0x00C0 0x0270 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_RD0__GPIO4_IO10                                           0x00C0 0x0270 0x0000 0x05 0x00
> +
> +#define MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                                   0x00C4 0x0274 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_RD1__LPUART3_CTS_B                                        0x00C4 0x0274 0x046C 0x01 0x01
> +#define MX91_PAD_ENET1_RD1__LPTMR2_ALT1                                          0x00C4 0x0274 0x0448 0x03 0x00
> +#define MX91_PAD_ENET1_RD1__FLEXIO2_FLEXIO11                                     0x00C4 0x0274 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_RD1__GPIO4_IO11                                           0x00C4 0x0274 0x0000 0x05 0x00
> +
> +#define MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                                   0x00C8 0x0278 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_RD2__LPTMR2_ALT2                                          0x00C8 0x0278 0x044C 0x03 0x00
> +#define MX91_PAD_ENET1_RD2__FLEXIO2_FLEXIO12                                     0x00C8 0x0278 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_RD2__GPIO4_IO12                                           0x00C8 0x0278 0x0000 0x05 0x00
> +
> +#define MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                                   0x00CC 0x027C 0x0000 0x00 0x00
> +#define MX91_PAD_ENET1_RD3__FLEXSPI1_TESTER_TRIGGER                              0x00CC 0x027C 0x0000 0x02 0x00
> +#define MX91_PAD_ENET1_RD3__LPTMR2_ALT3                                          0x00CC 0x027C 0x0450 0x03 0x00
> +#define MX91_PAD_ENET1_RD3__FLEXIO2_FLEXIO13                                     0x00CC 0x027C 0x0000 0x04 0x00
> +#define MX91_PAD_ENET1_RD3__GPIO4_IO13                                           0x00CC 0x027C 0x0000 0x05 0x00
> +
> +#define MX91_PAD_ENET2_MDC__ENET2_MDC                                            0x00D0 0x0280 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_MDC__LPUART4_DCB_B                                        0x00D0 0x0280 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_MDC__SAI2_RX_SYNC                                         0x00D0 0x0280 0x0000 0x02 0x00
> +#define MX91_PAD_ENET2_MDC__FLEXIO2_FLEXIO14                                     0x00D0 0x0280 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_MDC__GPIO4_IO14                                           0x00D0 0x0280 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_MDC__MEDIAMIX_CAM_CLK                                     0x00D0 0x0280 0x04BC 0x06 0x01
> +
> +#define MX91_PAD_ENET2_MDIO__ENET2_MDIO                                          0x00D4 0x0284 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_MDIO__LPUART4_RIN_B                                       0x00D4 0x0284 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_MDIO__SAI2_RX_BCLK                                        0x00D4 0x0284 0x0000 0x02 0x00
> +#define MX91_PAD_ENET2_MDIO__FLEXIO2_FLEXIO15                                    0x00D4 0x0284 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_MDIO__GPIO4_IO15                                          0x00D4 0x0284 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_MDIO__MEDIAMIX_CAM_DATA0                                  0x00D4 0x0284 0x0490 0x06 0x01
> +
> +#define MX91_PAD_ENET2_TD3__SAI2_RX_DATA0                                        0x00D8 0x0288 0x0000 0x02 0x00
> +#define MX91_PAD_ENET2_TD3__FLEXIO2_FLEXIO16                                     0x00D8 0x0288 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_TD3__GPIO4_IO16                                           0x00D8 0x0288 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_TD3__MEDIAMIX_CAM_VSYNC                                   0x00D8 0x0288 0x04C0 0x06 0x01
> +#define MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3                                      0x00D8 0x0288 0x0000 0x00 0x00
> +
> +#define MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2                                      0x00DC 0x028C 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_TD2__ENET2_TX_CLK2                                        0x00DC 0x028C 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_TD2__FLEXIO2_FLEXIO17                                     0x00DC 0x028C 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_TD2__GPIO4_IO17                                           0x00DC 0x028C 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_TD2__MEDIAMIX_CAM_HSYNC                                   0x00DC 0x028C 0x04B8 0x06 0x01
> +
> +#define MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1                                      0x00E0 0x0290 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_TD1__LPUART4_RTS_B                                        0x00E0 0x0290 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_TD1__FLEXIO2_FLEXIO18                                     0x00E0 0x0290 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_TD1__GPIO4_IO18                                           0x00E0 0x0290 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_TD1__MEDIAMIX_CAM_DATA1                                   0x00E0 0x0290 0x0494 0x06 0x01
> +
> +#define MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0                                      0x00E4 0x0294 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_TD0__LPUART4_TX                                           0x00E4 0x0294 0x0480 0x01 0x01
> +#define MX91_PAD_ENET2_TD0__FLEXIO2_FLEXIO19                                     0x00E4 0x0294 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_TD0__GPIO4_IO19                                           0x00E4 0x0294 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_TD0__MEDIAMIX_CAM_DATA2                                   0x00E4 0x0294 0x0498 0x06 0x01
> +
> +#define MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL                                0x00E8 0x0298 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_TX_CTL__LPUART4_DTR_B                                     0x00E8 0x0298 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_TX_CTL__SAI2_TX_SYNC                                      0x00E8 0x0298 0x0000 0x02 0x00
> +#define MX91_PAD_ENET2_TX_CTL__FLEXIO2_FLEXIO20                                  0x00E8 0x0298 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_TX_CTL__GPIO4_IO20                                        0x00E8 0x0298 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_TX_CTL__MEDIAMIX_CAM_DATA3                                0x00E8 0x0298 0x049C 0x06 0x01
> +
> +#define MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC                                      0x00EC 0x029C 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_TXC__ENET2_TX_ER                                          0x00EC 0x029C 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_TXC__SAI2_TX_BCLK                                         0x00EC 0x029C 0x0000 0x02 0x00
> +#define MX91_PAD_ENET2_TXC__FLEXIO2_FLEXIO21                                     0x00EC 0x029C 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_TXC__GPIO4_IO21                                           0x00EC 0x029C 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_TXC__MEDIAMIX_CAM_DATA4                                   0x00EC 0x029C 0x04A0 0x06 0x01
> +
> +#define MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL                                0x00F0 0x02A0 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_RX_CTL__LPUART4_DSR_B                                     0x00F0 0x02A0 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_RX_CTL__SAI2_TX_DATA0                                     0x00F0 0x02A0 0x0000 0x02 0x00
> +#define MX91_PAD_ENET2_RX_CTL__FLEXIO2_FLEXIO22                                  0x00F0 0x02A0 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_RX_CTL__GPIO4_IO22                                        0x00F0 0x02A0 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_RX_CTL__MEDIAMIX_CAM_DATA5                                0x00F0 0x02A0 0x04A4 0x06 0x01
> +
> +#define MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC                                      0x00F4 0x02A4 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_RXC__ENET2_RX_ER                                          0x00F4 0x02A4 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_RXC__FLEXIO2_FLEXIO23                                     0x00F4 0x02A4 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_RXC__GPIO4_IO23                                           0x00F4 0x02A4 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_RXC__MEDIAMIX_CAM_DATA6                                   0x00F4 0x02A4 0x04A8 0x06 0x01
> +
> +#define MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0                                      0x00F8 0x02A8 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_RD0__LPUART4_RX                                           0x00F8 0x02A8 0x047C 0x01 0x01
> +#define MX91_PAD_ENET2_RD0__FLEXIO2_FLEXIO24                                     0x00F8 0x02A8 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_RD0__GPIO4_IO24                                           0x00F8 0x02A8 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_RD0__MEDIAMIX_CAM_DATA7                                   0x00F8 0x02A8 0x04AC 0x06 0x01
> +
> +#define MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1                                      0x00FC 0x02AC 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_RD1__SPDIF_IN                                             0x00FC 0x02AC 0x04E4 0x01 0x01
> +#define MX91_PAD_ENET2_RD1__FLEXIO2_FLEXIO25                                     0x00FC 0x02AC 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_RD1__GPIO4_IO25                                           0x00FC 0x02AC 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_RD1__MEDIAMIX_CAM_DATA8                                   0x00FC 0x02AC 0x04B0 0x06 0x01
> +
> +#define MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2                                      0x0100 0x02B0 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_RD2__LPUART4_CTS_B                                        0x0100 0x02B0 0x0478 0x01 0x01
> +#define MX91_PAD_ENET2_RD2__SAI2_MCLK                                            0x0100 0x02B0 0x0000 0x02 0x00
> +#define MX91_PAD_ENET2_RD2__MQS2_RIGHT                                           0x0100 0x02B0 0x0000 0x03 0x00
> +#define MX91_PAD_ENET2_RD2__FLEXIO2_FLEXIO26                                     0x0100 0x02B0 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_RD2__GPIO4_IO26                                           0x0100 0x02B0 0x0000 0x05 0x00
> +#define MX91_PAD_ENET2_RD2__MEDIAMIX_CAM_DATA9                                   0x0100 0x02B0 0x04B4 0x06 0x01
> +
> +#define MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3                                      0x0104 0x02B4 0x0000 0x00 0x00
> +#define MX91_PAD_ENET2_RD3__SPDIF_OUT                                            0x0104 0x02B4 0x0000 0x01 0x00
> +#define MX91_PAD_ENET2_RD3__SPDIF_IN                                             0x0104 0x02B4 0x04E4 0x02 0x02
> +#define MX91_PAD_ENET2_RD3__MQS2_LEFT                                            0x0104 0x02B4 0x0000 0x03 0x00
> +#define MX91_PAD_ENET2_RD3__FLEXIO2_FLEXIO27                                     0x0104 0x02B4 0x0000 0x04 0x00
> +#define MX91_PAD_ENET2_RD3__GPIO4_IO27                                           0x0104 0x02B4 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SD1_CLK__FLEXIO1_FLEXIO8                                        0x0108 0x02B8 0x038C 0x04 0x01
> +#define MX91_PAD_SD1_CLK__GPIO3_IO8                                              0x0108 0x02B8 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_CLK__USDHC1_CLK                                             0x0108 0x02B8 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_CLK__LPSPI2_SCK                                             0x0108 0x02B8 0x043C 0x03 0x01
> +
> +#define MX91_PAD_SD1_CMD__USDHC1_CMD                                             0x010C 0x02BC 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_CMD__FLEXIO1_FLEXIO9                                        0x010C 0x02BC 0x0390 0x04 0x01
> +#define MX91_PAD_SD1_CMD__GPIO3_IO9                                              0x010C 0x02BC 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_CMD__LPSPI2_SIN                                             0x010C 0x02BC 0x0440 0x03 0x01
> +
> +#define MX91_PAD_SD1_DATA0__USDHC1_DATA0                                         0x0110 0x02C0 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_DATA0__FLEXIO1_FLEXIO10                                     0x0110 0x02C0 0x0394 0x04 0x01
> +#define MX91_PAD_SD1_DATA0__GPIO3_IO10                                           0x0110 0x02C0 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_DATA0__LPSPI2_PCS0                                          0x0110 0x02C0 0x0434 0x03 0x01
> +
> +#define MX91_PAD_SD1_DATA1__USDHC1_DATA1                                         0x0114 0x02C4 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_DATA1__FLEXIO1_FLEXIO11                                     0x0114 0x02C4 0x0398 0x04 0x01
> +#define MX91_PAD_SD1_DATA1__GPIO3_IO11                                           0x0114 0x02C4 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_DATA1__CCMSRCGPCMIX_INT_BOOT                                0x0114 0x02C4 0x0000 0x06 0x00
> +#define MX91_PAD_SD1_DATA1__LPSPI2_SOUT                                          0x0114 0x02C4 0x0444 0x03 0x01
> +
> +#define MX91_PAD_SD1_DATA2__USDHC1_DATA2                                         0x0118 0x02C8 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_DATA2__FLEXIO1_FLEXIO12                                     0x0118 0x02C8 0x0000 0x04 0x00
> +#define MX91_PAD_SD1_DATA2__GPIO3_IO12                                           0x0118 0x02C8 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_DATA2__CCMSRCGPCMIX_PMIC_READY                              0x0118 0x02C8 0x0000 0x06 0x00
> +#define MX91_PAD_SD1_DATA2__LPSPI2_PCS1                                          0x0118 0x02C8 0x0438 0x03 0x00
> +
> +#define MX91_PAD_SD1_DATA3__USDHC1_DATA3                                         0x011C 0x02CC 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_DATA3__FLEXSPI1_A_SS1_B                                     0x011C 0x02CC 0x0000 0x01 0x00
> +#define MX91_PAD_SD1_DATA3__FLEXIO1_FLEXIO13                                     0x011C 0x02CC 0x039C 0x04 0x01
> +#define MX91_PAD_SD1_DATA3__GPIO3_IO13                                           0x011C 0x02CC 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_DATA3__LPSPI1_PCS1                                          0x011C 0x02CC 0x0424 0x03 0x00
> +
> +#define MX91_PAD_SD1_DATA4__USDHC1_DATA4                                         0x0120 0x02D0 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_DATA4__FLEXSPI1_A_DATA4                                     0x0120 0x02D0 0x0000 0x01 0x00
> +#define MX91_PAD_SD1_DATA4__FLEXIO1_FLEXIO14                                     0x0120 0x02D0 0x03A0 0x04 0x01
> +#define MX91_PAD_SD1_DATA4__GPIO3_IO14                                           0x0120 0x02D0 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_DATA4__LPSPI1_PCS0                                          0x0120 0x02D0 0x0420 0x03 0x00
> +
> +#define MX91_PAD_SD1_DATA5__USDHC1_DATA5                                         0x0124 0x02D4 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_DATA5__FLEXSPI1_A_DATA5                                     0x0124 0x02D4 0x0000 0x01 0x00
> +#define MX91_PAD_SD1_DATA5__USDHC1_RESET_B                                       0x0124 0x02D4 0x0000 0x02 0x00
> +#define MX91_PAD_SD1_DATA5__FLEXIO1_FLEXIO15                                     0x0124 0x02D4 0x03A4 0x04 0x01
> +#define MX91_PAD_SD1_DATA5__GPIO3_IO15                                           0x0124 0x02D4 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_DATA5__LPSPI1_SIN                                           0x0124 0x02D4 0x042C 0x03 0x00
> +
> +#define MX91_PAD_SD1_DATA6__USDHC1_DATA6                                         0x0128 0x02D8 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_DATA6__FLEXSPI1_A_DATA6                                     0x0128 0x02D8 0x0000 0x01 0x00
> +#define MX91_PAD_SD1_DATA6__USDHC1_CD_B                                          0x0128 0x02D8 0x0000 0x02 0x00
> +#define MX91_PAD_SD1_DATA6__FLEXIO1_FLEXIO16                                     0x0128 0x02D8 0x03A8 0x04 0x01
> +#define MX91_PAD_SD1_DATA6__GPIO3_IO16                                           0x0128 0x02D8 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_DATA6__LPSPI1_SCK                                           0x0128 0x02D8 0x0428 0x03 0x00
> +
> +#define MX91_PAD_SD1_DATA7__USDHC1_DATA7                                         0x012C 0x02DC 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_DATA7__FLEXSPI1_A_DATA7                                     0x012C 0x02DC 0x0000 0x01 0x00
> +#define MX91_PAD_SD1_DATA7__USDHC1_WP                                            0x012C 0x02DC 0x0000 0x02 0x00
> +#define MX91_PAD_SD1_DATA7__FLEXIO1_FLEXIO17                                     0x012C 0x02DC 0x03AC 0x04 0x01
> +#define MX91_PAD_SD1_DATA7__GPIO3_IO17                                           0x012C 0x02DC 0x0000 0x05 0x00
> +#define MX91_PAD_SD1_DATA7__LPSPI1_SOUT                                          0x012C 0x02DC 0x0430 0x03 0x00
> +
> +#define MX91_PAD_SD1_STROBE__USDHC1_STROBE                                       0x0130 0x02E0 0x0000 0x00 0x00
> +#define MX91_PAD_SD1_STROBE__FLEXSPI1_A_DQS                                      0x0130 0x02E0 0x0000 0x01 0x00
> +#define MX91_PAD_SD1_STROBE__FLEXIO1_FLEXIO18                                    0x0130 0x02E0 0x03B0 0x04 0x01
> +#define MX91_PAD_SD1_STROBE__GPIO3_IO18                                          0x0130 0x02E0 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                                     0x0134 0x02E4 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_VSELECT__USDHC2_WP                                          0x0134 0x02E4 0x0000 0x01 0x00
> +#define MX91_PAD_SD2_VSELECT__LPTMR2_ALT3                                        0x0134 0x02E4 0x0450 0x02 0x01
> +#define MX91_PAD_SD2_VSELECT__FLEXIO1_FLEXIO19                                   0x0134 0x02E4 0x0000 0x04 0x00
> +#define MX91_PAD_SD2_VSELECT__GPIO3_IO19                                         0x0134 0x02E4 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_VSELECT__CCMSRCGPCMIX_EXT_CLK1                              0x0134 0x02E4 0x0368 0x06 0x00
> +
> +#define MX91_PAD_SD3_CLK__USDHC3_CLK                                             0x0138 0x02E8 0x04E8 0x00 0x01
> +#define MX91_PAD_SD3_CLK__FLEXSPI1_A_SCLK                                        0x0138 0x02E8 0x0000 0x01 0x00
> +#define MX91_PAD_SD3_CLK__LPUART1_CTS_B                                          0x0138 0x02E8 0x0454 0x02 0x00
> +#define MX91_PAD_SD3_CLK__FLEXIO1_FLEXIO20                                       0x0138 0x02E8 0x03B4 0x04 0x01
> +#define MX91_PAD_SD3_CLK__GPIO3_IO20                                             0x0138 0x02E8 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SD3_CMD__USDHC3_CMD                                             0x013C 0x02EC 0x04EC 0x00 0x01
> +#define MX91_PAD_SD3_CMD__FLEXSPI1_A_SS0_B                                       0x013C 0x02EC 0x0000 0x01 0x00
> +#define MX91_PAD_SD3_CMD__LPUART1_RTS_B                                          0x013C 0x02EC 0x0000 0x02 0x00
> +#define MX91_PAD_SD3_CMD__FLEXIO1_FLEXIO21                                       0x013C 0x02EC 0x0000 0x04 0x00
> +#define MX91_PAD_SD3_CMD__GPIO3_IO21                                             0x013C 0x02EC 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SD3_DATA0__USDHC3_DATA0                                         0x0140 0x02F0 0x04F0 0x00 0x01
> +#define MX91_PAD_SD3_DATA0__FLEXSPI1_A_DATA0                                     0x0140 0x02F0 0x0000 0x01 0x00
> +#define MX91_PAD_SD3_DATA0__LPUART2_CTS_B                                        0x0140 0x02F0 0x0460 0x02 0x00
> +#define MX91_PAD_SD3_DATA0__FLEXIO1_FLEXIO22                                     0x0140 0x02F0 0x03B8 0x04 0x01
> +#define MX91_PAD_SD3_DATA0__GPIO3_IO22                                           0x0140 0x02F0 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SD3_DATA1__USDHC3_DATA1                                         0x0144 0x02F4 0x04F4 0x00 0x01
> +#define MX91_PAD_SD3_DATA1__FLEXSPI1_A_DATA1                                     0x0144 0x02F4 0x0000 0x01 0x00
> +#define MX91_PAD_SD3_DATA1__LPUART2_RTS_B                                        0x0144 0x02F4 0x0000 0x02 0x00
> +#define MX91_PAD_SD3_DATA1__FLEXIO1_FLEXIO23                                     0x0144 0x02F4 0x03BC 0x04 0x01
> +#define MX91_PAD_SD3_DATA1__GPIO3_IO23                                           0x0144 0x02F4 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SD3_DATA2__USDHC3_DATA2                                         0x0148 0x02F8 0x04F8 0x00 0x01
> +#define MX91_PAD_SD3_DATA2__LPI2C4_SDA                                           0x0148 0x02F8 0x03FC 0x02 0x01
> +#define MX91_PAD_SD3_DATA2__FLEXSPI1_A_DATA2                                     0x0148 0x02F8 0x0000 0x01 0x00
> +#define MX91_PAD_SD3_DATA2__FLEXIO1_FLEXIO24                                     0x0148 0x02F8 0x03C0 0x04 0x01
> +#define MX91_PAD_SD3_DATA2__GPIO3_IO24                                           0x0148 0x02F8 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SD3_DATA3__USDHC3_DATA3                                         0x014C 0x02FC 0x04FC 0x00 0x01
> +#define MX91_PAD_SD3_DATA3__FLEXSPI1_A_DATA3                                     0x014C 0x02FC 0x0000 0x01 0x00
> +#define MX91_PAD_SD3_DATA3__LPI2C4_SCL                                           0x014C 0x02FC 0x03F8 0x02 0x01
> +#define MX91_PAD_SD3_DATA3__FLEXIO1_FLEXIO25                                     0x014C 0x02FC 0x03C4 0x04 0x01
> +#define MX91_PAD_SD3_DATA3__GPIO3_IO25                                           0x014C 0x02FC 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SD2_CD_B__USDHC2_CD_B                                           0x0150 0x0300 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_CD_B__ENET_QOS_1588_EVENT0_IN                               0x0150 0x0300 0x0000 0x01 0x00
> +#define MX91_PAD_SD2_CD_B__I3C2_SCL                                              0x0150 0x0300 0x03CC 0x02 0x01
> +#define MX91_PAD_SD2_CD_B__FLEXIO1_FLEXIO0                                       0x0150 0x0300 0x036C 0x04 0x01
> +#define MX91_PAD_SD2_CD_B__GPIO3_IO0                                             0x0150 0x0300 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_CD_B__LPI2C1_SCL                                            0x0150 0x0300 0x03E0 0x03 0x01
> +
> +#define MX91_PAD_SD2_CLK__USDHC2_CLK                                             0x0154 0x0304 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_CLK__ENET_QOS_1588_EVENT0_OUT                               0x0154 0x0304 0x0000 0x01 0x00
> +#define MX91_PAD_SD2_CLK__I2C1_SDA                                               0x0154 0x0304 0x0000 0x03 0x00
> +#define MX91_PAD_SD2_CLK__I3C2_SDA                                               0x0154 0x0304 0x03D0 0x02 0x01
> +#define MX91_PAD_SD2_CLK__FLEXIO1_FLEXIO1                                        0x0154 0x0304 0x0370 0x04 0x01
> +#define MX91_PAD_SD2_CLK__GPIO3_IO1                                              0x0154 0x0304 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_CLK__CCMSRCGPCMIX_OBSERVE0                                  0x0154 0x0304 0x0000 0x06 0x00
> +#define MX91_PAD_SD2_CLK__LPI2C1_SDA                                             0x0154 0x0304 0x03E4 0x03 0x01
> +
> +#define MX91_PAD_SD2_CMD__USDHC2_CMD                                             0x0158 0x0308 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_CMD__ENET2_1588_EVENT0_IN                                   0x0158 0x0308 0x0000 0x01 0x00
> +#define MX91_PAD_SD2_CMD__I3C2_PUR                                               0x0158 0x0308 0x0000 0x02 0x00
> +#define MX91_PAD_SD2_CMD__I3C2_PUR_B                                             0x0158 0x0308 0x0000 0x03 0x00
> +#define MX91_PAD_SD2_CMD__FLEXIO1_FLEXIO2                                        0x0158 0x0308 0x0374 0x04 0x01
> +#define MX91_PAD_SD2_CMD__GPIO3_IO2                                              0x0158 0x0308 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_CMD__CCMSRCGPCMIX_OBSERVE1                                  0x0158 0x0308 0x0000 0x06 0x00
> +
> +#define MX91_PAD_SD2_DATA0__USDHC2_DATA0                                         0x015C 0x030C 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_DATA0__ENET2_1588_EVENT0_OUT                                0x015C 0x030C 0x0000 0x01 0x00
> +#define MX91_PAD_SD2_DATA0__CAN2_TX                                              0x015C 0x030C 0x0000 0x02 0x00
> +#define MX91_PAD_SD2_DATA0__FLEXIO1_FLEXIO3                                      0x015C 0x030C 0x0378 0x04 0x01
> +#define MX91_PAD_SD2_DATA0__GPIO3_IO3                                            0x015C 0x030C 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_DATA0__LPUART1_TX                                           0x015C 0x030C 0x045C 0x03 0x00
> +#define MX91_PAD_SD2_DATA0__CCMSRCGPCMIX_OBSERVE2                                0x015C 0x030C 0x0000 0x06 0x00
> +
> +#define MX91_PAD_SD2_DATA1__USDHC2_DATA1                                         0x0160 0x0310 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_DATA1__ENET2_1588_EVENT1_IN                                 0x0160 0x0310 0x0000 0x01 0x00
> +#define MX91_PAD_SD2_DATA1__CAN2_RX                                              0x0160 0x0310 0x0364 0x02 0x03
> +#define MX91_PAD_SD2_DATA1__FLEXIO1_FLEXIO4                                      0x0160 0x0310 0x037C 0x04 0x01
> +#define MX91_PAD_SD2_DATA1__GPIO3_IO4                                            0x0160 0x0310 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_DATA1__LPUART1_RX                                           0x0160 0x0310 0x0458 0x03 0x00
> +#define MX91_PAD_SD2_DATA1__CCMSRCGPCMIX_WAIT                                    0x0160 0x0310 0x0000 0x06 0x00
> +
> +#define MX91_PAD_SD2_DATA2__USDHC2_DATA2                                         0x0164 0x0314 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_DATA2__ENET2_1588_EVENT1_OUT                                0x0164 0x0314 0x0000 0x01 0x00
> +#define MX91_PAD_SD2_DATA2__MQS2_RIGHT                                           0x0164 0x0314 0x0000 0x02 0x00
> +#define MX91_PAD_SD2_DATA2__FLEXIO1_FLEXIO5                                      0x0164 0x0314 0x0380 0x04 0x01
> +#define MX91_PAD_SD2_DATA2__GPIO3_IO5                                            0x0164 0x0314 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_DATA2__LPUART2_TX                                           0x0164 0x0314 0x0468 0x03 0x00
> +#define MX91_PAD_SD2_DATA2__CCMSRCGPCMIX_STOP                                    0x0164 0x0314 0x0000 0x06 0x00
> +
> +#define MX91_PAD_SD2_DATA3__USDHC2_DATA3                                         0x0168 0x0318 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_DATA3__LPTMR2_ALT1                                          0x0168 0x0318 0x0448 0x01 0x01
> +#define MX91_PAD_SD2_DATA3__MQS2_LEFT                                            0x0168 0x0318 0x0000 0x02 0x00
> +#define MX91_PAD_SD2_DATA3__FLEXIO1_FLEXIO6                                      0x0168 0x0318 0x0384 0x04 0x01
> +#define MX91_PAD_SD2_DATA3__GPIO3_IO6                                            0x0168 0x0318 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_DATA3__LPUART2_RX                                           0x0168 0x0318 0x0464 0x03 0x00
> +#define MX91_PAD_SD2_DATA3__CCMSRCGPCMIX_EARLY_RESET                             0x0168 0x0318 0x0000 0x06 0x00
> +
> +#define MX91_PAD_SD2_RESET_B__USDHC2_RESET_B                                     0x016C 0x031C 0x0000 0x00 0x00
> +#define MX91_PAD_SD2_RESET_B__LPTMR2_ALT2                                        0x016C 0x031C 0x044C 0x01 0x01
> +#define MX91_PAD_SD2_RESET_B__FLEXIO1_FLEXIO7                                    0x016C 0x031C 0x0388 0x04 0x01
> +#define MX91_PAD_SD2_RESET_B__GPIO3_IO7                                          0x016C 0x031C 0x0000 0x05 0x00
> +#define MX91_PAD_SD2_RESET_B__CCMSRCGPCMIX_SYSTEM_RESET                          0x016C 0x031C 0x0000 0x06 0x00
> +
> +#define MX91_PAD_I2C1_SCL__LPI2C1_SCL                                            0x0170 0x0320 0x03E0 0x00 0x02
> +#define MX91_PAD_I2C1_SCL__I3C1_SCL                                              0x0170 0x0320 0x0000 0x01 0x00
> +#define MX91_PAD_I2C1_SCL__LPUART1_DCB_B                                         0x0170 0x0320 0x0000 0x02 0x00
> +#define MX91_PAD_I2C1_SCL__TPM2_CH0                                              0x0170 0x0320 0x0000 0x03 0x00
> +#define MX91_PAD_I2C1_SCL__GPIO1_IO0                                             0x0170 0x0320 0x0000 0x05 0x00
> +
> +#define MX91_PAD_I2C1_SDA__LPI2C1_SDA                                            0x0174 0x0324 0x03E4 0x00 0x02
> +#define MX91_PAD_I2C1_SDA__I3C1_SDA                                              0x0174 0x0324 0x0000 0x01 0x00
> +#define MX91_PAD_I2C1_SDA__LPUART1_RIN_B                                         0x0174 0x0324 0x0000 0x02 0x00
> +#define MX91_PAD_I2C1_SDA__TPM2_CH1                                              0x0174 0x0324 0x0000 0x03 0x00
> +#define MX91_PAD_I2C1_SDA__GPIO1_IO1                                             0x0174 0x0324 0x0000 0x05 0x00
> +
> +#define MX91_PAD_I2C2_SCL__LPI2C2_SCL                                            0x0178 0x0328 0x03E8 0x00 0x01
> +#define MX91_PAD_I2C2_SCL__I3C1_PUR                                              0x0178 0x0328 0x0000 0x01 0x00
> +#define MX91_PAD_I2C2_SCL__LPUART2_DCB_B                                         0x0178 0x0328 0x0000 0x02 0x00
> +#define MX91_PAD_I2C2_SCL__TPM2_CH2                                              0x0178 0x0328 0x0000 0x03 0x00
> +#define MX91_PAD_I2C2_SCL__SAI1_RX_SYNC                                          0x0178 0x0328 0x0000 0x04 0x00
> +#define MX91_PAD_I2C2_SCL__GPIO1_IO3                                             0x0178 0x0328 0x0000 0x05 0x00
> +#define MX91_PAD_I2C2_SCL__I3C1_PUR_B                                            0x0178 0x0328 0x0000 0x06 0x00
> +
> +#define MX91_PAD_I2C2_SDA__LPI2C2_SDA                                            0x017C 0x032C 0x03EC 0x00 0x01
> +#define MX91_PAD_I2C2_SDA__LPUART2_RIN_B                                         0x017C 0x032C 0x0000 0x02 0x00
> +#define MX91_PAD_I2C2_SDA__TPM2_CH3                                              0x017C 0x032C 0x0000 0x03 0x00
> +#define MX91_PAD_I2C2_SDA__SAI1_RX_BCLK                                          0x017C 0x032C 0x0000 0x04 0x00
> +#define MX91_PAD_I2C2_SDA__GPIO1_IO3                                             0x017C 0x032C 0x0000 0x05 0x00
> +
> +#define MX91_PAD_UART1_RXD__LPUART1_RX                                           0x0180 0x0330 0x0458 0x00 0x01
> +#define MX91_PAD_UART1_RXD__ELE_UART_RX                                          0x0180 0x0330 0x0000 0x01 0x00
> +#define MX91_PAD_UART1_RXD__LPSPI2_SIN                                           0x0180 0x0330 0x0440 0x02 0x02
> +#define MX91_PAD_UART1_RXD__TPM1_CH0                                             0x0180 0x0330 0x0000 0x03 0x00
> +#define MX91_PAD_UART1_RXD__GPIO1_IO4                                            0x0180 0x0330 0x0000 0x05 0x00
> +
> +#define MX91_PAD_UART1_TXD__LPUART1_TX                                           0x0184 0x0334 0x045C 0x00 0x01
> +#define MX91_PAD_UART1_TXD__ELE_UART_TX                                          0x0184 0x0334 0x0000 0x01 0x00
> +#define MX91_PAD_UART1_TXD__LPSPI2_PCS0                                          0x0184 0x0334 0x0434 0x02 0x02
> +#define MX91_PAD_UART1_TXD__TPM1_CH1                                             0x0184 0x0334 0x0000 0x03 0x00
> +#define MX91_PAD_UART1_TXD__GPIO1_IO5                                            0x0184 0x0334 0x0000 0x05 0x00
> +
> +#define MX91_PAD_UART2_RXD__LPUART2_RX                                           0x0188 0x0338 0x0464 0x00 0x01
> +#define MX91_PAD_UART2_RXD__LPUART1_CTS_B                                        0x0188 0x0338 0x0454 0x01 0x01
> +#define MX91_PAD_UART2_RXD__LPSPI2_SOUT                                          0x0188 0x0338 0x0444 0x02 0x02
> +#define MX91_PAD_UART2_RXD__TPM1_CH2                                             0x0188 0x0338 0x0000 0x03 0x00
> +#define MX91_PAD_UART2_RXD__SAI1_MCLK                                            0x0188 0x0338 0x04D4 0x04 0x00
> +#define MX91_PAD_UART2_RXD__GPIO1_IO6                                            0x0188 0x0338 0x0000 0x05 0x00
> +
> +#define MX91_PAD_UART2_TXD__LPUART2_TX                                           0x018C 0x033C 0x0468 0x00 0x01
> +#define MX91_PAD_UART2_TXD__LPUART1_RTS_B                                        0x018C 0x033C 0x0000 0x01 0x00
> +#define MX91_PAD_UART2_TXD__LPSPI2_SCK                                           0x018C 0x033C 0x043C 0x02 0x02
> +#define MX91_PAD_UART2_TXD__TPM1_CH3                                             0x018C 0x033C 0x0000 0x03 0x00
> +#define MX91_PAD_UART2_TXD__GPIO1_IO7                                            0x018C 0x033C 0x0000 0x05 0x00
> +#define MX91_PAD_UART2_TXD__SAI3_TX_SYNC                                         0x018C 0x033C 0x04E0 0x07 0x02
> +
> +#define MX91_PAD_PDM_CLK__PDM_CLK                                                0x0190 0x0340 0x0000 0x00 0x00
> +#define MX91_PAD_PDM_CLK__MQS1_LEFT                                              0x0190 0x0340 0x0000 0x01 0x00
> +#define MX91_PAD_PDM_CLK__LPTMR1_ALT1                                            0x0190 0x0340 0x0000 0x04 0x00
> +#define MX91_PAD_PDM_CLK__GPIO1_IO8                                              0x0190 0x0340 0x0000 0x05 0x00
> +#define MX91_PAD_PDM_CLK__CAN1_TX                                                0x0190 0x0340 0x0000 0x06 0x00
> +
> +#define MX91_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0                                0x0194 0x0344 0x04C4 0x00 0x02
> +#define MX91_PAD_PDM_BIT_STREAM0__MQS1_RIGHT                                     0x0194 0x0344 0x0000 0x01 0x00
> +#define MX91_PAD_PDM_BIT_STREAM0__LPSPI1_PCS1                                    0x0194 0x0344 0x0424 0x02 0x01
> +#define MX91_PAD_PDM_BIT_STREAM0__TPM1_EXTCLK                                    0x0194 0x0344 0x0000 0x03 0x00
> +#define MX91_PAD_PDM_BIT_STREAM0__LPTMR1_ALT2                                    0x0194 0x0344 0x0000 0x04 0x00
> +#define MX91_PAD_PDM_BIT_STREAM0__GPIO1_IO9                                      0x0194 0x0344 0x0000 0x05 0x00
> +#define MX91_PAD_PDM_BIT_STREAM0__CAN1_RX                                        0x0194 0x0344 0x0360 0x06 0x01
> +
> +#define MX91_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1                                0x0198 0x0348 0x04C8 0x00 0x02
> +#define MX91_PAD_PDM_BIT_STREAM1__LPSPI2_PCS1                                    0x0198 0x0348 0x0438 0x02 0x01
> +#define MX91_PAD_PDM_BIT_STREAM1__TPM2_EXTCLK                                    0x0198 0x0348 0x0000 0x03 0x00
> +#define MX91_PAD_PDM_BIT_STREAM1__LPTMR1_ALT3                                    0x0198 0x0348 0x0000 0x04 0x00
> +#define MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10                                     0x0198 0x0348 0x0000 0x05 0x00
> +#define MX91_PAD_PDM_BIT_STREAM1__CCMSRCGPCMIX_EXT_CLK1                          0x0198 0x0348 0x0368 0x06 0x01
> +
> +#define MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC                                         0x019C 0x034C 0x0000 0x00 0x00
> +#define MX91_PAD_SAI1_TXFS__SAI1_TX_DATA1                                        0x019C 0x034C 0x0000 0x01 0x00
> +#define MX91_PAD_SAI1_TXFS__LPSPI1_PCS0                                          0x019C 0x034C 0x0420 0x02 0x01
> +#define MX91_PAD_SAI1_TXFS__LPUART2_DTR_B                                        0x019C 0x034C 0x0000 0x03 0x00
> +#define MX91_PAD_SAI1_TXFS__MQS1_LEFT                                            0x019C 0x034C 0x0000 0x04 0x00
> +#define MX91_PAD_SAI1_TXFS__GPIO1_IO11                                           0x019C 0x034C 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SAI1_TXC__SAI1_TX_BCLK                                          0x01A0 0x0350 0x0000 0x00 0x00
> +#define MX91_PAD_SAI1_TXC__LPUART2_CTS_B                                         0x01A0 0x0350 0x0460 0x01 0x01
> +#define MX91_PAD_SAI1_TXC__LPSPI1_SIN                                            0x01A0 0x0350 0x042C 0x02 0x01
> +#define MX91_PAD_SAI1_TXC__LPUART1_DSR_B                                         0x01A0 0x0350 0x0000 0x03 0x00
> +#define MX91_PAD_SAI1_TXC__CAN1_RX                                               0x01A0 0x0350 0x0360 0x04 0x02
> +#define MX91_PAD_SAI1_TXC__GPIO1_IO12                                            0x01A0 0x0350 0x0000 0x05 0x00
> +
> +#define MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0                                        0x01A4 0x0354 0x0000 0x00 0x00
> +#define MX91_PAD_SAI1_TXD0__LPUART2_RTS_B                                        0x01A4 0x0354 0x0000 0x01 0x00
> +#define MX91_PAD_SAI1_TXD0__LPSPI1_SCK                                           0x01A4 0x0354 0x0428 0x02 0x01
> +#define MX91_PAD_SAI1_TXD0__LPUART1_DTR_B                                        0x01A4 0x0354 0x0000 0x03 0x00
> +#define MX91_PAD_SAI1_TXD0__CAN1_TX                                              0x01A4 0x0354 0x0000 0x04 0x00
> +#define MX91_PAD_SAI1_TXD0__GPIO1_IO13                                           0x01A4 0x0354 0x0000 0x05 0x00
> +#define MX91_PAD_SAI1_TXD0__SAI1_MCLK                                            0x01A4 0x0354 0x04D4 0x06 0x01
> +
> +#define MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0                                        0x01A8 0x0358 0x0000 0x00 0x00
> +#define MX91_PAD_SAI1_RXD0__SAI1_MCLK                                            0x01A8 0x0358 0x04D4 0x01 0x02
> +#define MX91_PAD_SAI1_RXD0__LPSPI1_SOUT                                          0x01A8 0x0358 0x0430 0x02 0x01
> +#define MX91_PAD_SAI1_RXD0__LPUART2_DSR_B                                        0x01A8 0x0358 0x0000 0x03 0x00
> +#define MX91_PAD_SAI1_RXD0__MQS1_RIGHT                                           0x01A8 0x0358 0x0000 0x04 0x00
> +#define MX91_PAD_SAI1_RXD0__GPIO1_IO14                                           0x01A8 0x0358 0x0000 0x05 0x00
> +
> +#define MX91_PAD_WDOG_ANY__WDOG1_WDOG_ANY                                        0x01AC 0x035C 0x0000 0x00 0x00
> +#define MX91_PAD_WDOG_ANY__GPIO1_IO15                                            0x01AC 0x035C 0x0000 0x05 0x00
> +#endif /* __DTS_IMX91_PINFUNC_H */
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
> new file mode 100644
> index 000000000000..a9f4c1fe61cc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include "imx91-pinfunc.h"
> +#include "imx93.dtsi"
> +
> +&{/thermal-zones/cpu-thermal/cooling-maps/map0} {
> +	cooling-device =
> +		<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +};
> +
> +&clk {
> +	compatible = "fsl,imx91-ccm";
> +};
> +
> +&eqos {
> +	clocks = <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> +			<&clk IMX91_CLK_ENET_TIMER>,
> +			<&clk IMX91_CLK_ENET1_QOS_TSN>,
> +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;
> +	assigned-clocks = <&clk IMX91_CLK_ENET_TIMER>,
> +				<&clk IMX91_CLK_ENET1_QOS_TSN>;
> +	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> +};
> +
> +&fec {
> +	clocks = <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> +			<&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> +			<&clk IMX91_CLK_ENET_TIMER>,
> +			<&clk IMX91_CLK_ENET2_REGULAR>,
> +			<&clk IMX93_CLK_DUMMY>;
> +	assigned-clocks = <&clk IMX91_CLK_ENET_TIMER>,
> +				<&clk IMX91_CLK_ENET2_REGULAR>;
> +	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> +	assigned-clock-rates = <100000000>, <250000000>;
> +};
> +
> +&i3c1 {
> +	clocks = <&clk IMX93_CLK_BUS_AON>,
> +			<&clk IMX93_CLK_I3C1_GATE>,
> +			<&clk IMX93_CLK_DUMMY>;
> +};
> +
> +&i3c2 {
> +	clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
> +			<&clk IMX93_CLK_I3C2_GATE>,
> +			<&clk IMX93_CLK_DUMMY>;
> +};
> +
> +&tmu {
> +	status = "disabled";
> +};
> +
> +/* i.MX91 only has one A core */
> +/delete-node/ &A55_1;
> +
> +/* i.MX91 not has cm33 */
> +/delete-node/ &cm33;
> +
> +/* i.MX91 not has power-domain@44461800 */
> +/delete-node/ &mlmix;
> -- 
> 2.34.1
> 

