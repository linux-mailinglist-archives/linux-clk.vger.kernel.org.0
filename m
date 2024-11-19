Return-Path: <linux-clk+bounces-14823-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06C9D1D0B
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2024 02:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A391F224A1
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2024 01:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04EC5D8F0;
	Tue, 19 Nov 2024 01:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Iqz03f8A"
X-Original-To: linux-clk@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10E535D8;
	Tue, 19 Nov 2024 01:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731978911; cv=none; b=huWHHb9wTgt+EzH3PDd/Bd3PoxgI4y/YjasWt+RTevTVZckBc3I9ZkYMj/Y/xx7eLuSyH1/HdCP1DJiL2NVxYuywR15BWyHKCCWahOVYRgSiBEWminYvlJOyXe/E6G4tPawAmDHsiceZXNJcr1p5nH0dlLELgfgwCX7F7H225ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731978911; c=relaxed/simple;
	bh=ptQt5vUJMf2j7amn6mdIc2Rd0Q8JSSgq1Vb4NRNNzhw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BCexfaxEQTsD7yFG6mnV1S3YJFJCU3f1xWKYOKDRXpUNC/q7sc77xC3pz0sspI8gvFybe7JHfS2c8CQc7w8Z1MYiFKN0r8RLK14yaOZaF4zUdLlJAf4En9kV+tP40uSFYv58jyQcjxKe22tjQeTd+j+Rq3LB0ECKrcBH6PBUP6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Iqz03f8A; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 238A589274;
	Tue, 19 Nov 2024 02:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731978901;
	bh=Cb5xA4QrPjObXEuVAQV9BTBo9P9lF0LPOif/OFc8/Ys=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Iqz03f8A8ntVLExJdbOWEpa7BOXFN14gRPriudv2xawTis3YDMwOrO5fX9QGdUKyc
	 6VC1Q/FLuIrRIi0Cq9j4vmt9Lefazx84nEZVSnQe5Vg3DrU15cFGZV9oKRlL5ohaKs
	 2mpi1xkoP75X8XyH/KzFzpp1b1xnr0Q0u5ifDtVLLhP9gk7wOOpsVs7k1beL24Wi8j
	 W39TWSLAJXIpsXfn2590fguoCdogUDafNR1fv3EubZJc2wnAPObxYAG9tIxDUo12lp
	 KNSV4DMxPohhUvStuZlDdMaaGfmTqVrhzEKctC3T8Uxj7iFtjWL6z7RRtAh3MiXAUk
	 JWc5Pl1j62nhg==
Message-ID: <8a4fd234-4c7b-4a04-990d-3222aaa5172d@denx.de>
Date: Tue, 19 Nov 2024 02:13:18 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
To: Ying Liu <victor.liu@nxp.com>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
 <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
 <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/18/24 4:54 AM, Ying Liu wrote:
> Hi Marek,

Hi,

>>> media_disp1_pix clock is the pixel clock of the first i.MX8MP LCDIFv3
>>> display controller, while media_disp2_pix clock is the pixel clock of
>>> the second i.MX8MP LCDIFv3 display controller.  The two display
>>> controllers connect with Samsung MIPI DSI controller and LVDS Display
>>> Bridge(LDB) respectively.  Since the two display controllers are driven
>>> by separate DRM driver instances and the two pixel clocks may be derived
>>> from the same video_pll1_out clock(sys_pll3_out clock could be already
>>> used to derive audio_axi clock), there is no way to negotiate a dynamically
>>> changeable video_pll1_out clock rate to satisfy both of the two display
>>> controllers.  In this case, the only solution to drive them with the
>>> single video_pll1_out clock is to assign a sensible/unchangeable clock
>>> rate for video_pll1_out clock.  Thus, there is no need to set the
>>> CLK_SET_RATE_PARENT flag for media_disp{1,2}_pix clocks, drop it then.
>>>
>>> Fixes: ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock
>> reconfigure parent rate")
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> Uh, I almost missed this revert between all the LDB patches.
>>
>> This revert will break my usecase on MX8MP where I need to operate two
>> disparate panels attached to LVDS and TC358767 DSI-to-DP bridge and I
>> need accurate pixel clock for both. Not being able to configure accurate
>> pixel clock will make the displays not work, so from my side, this is a
>> NAK, sorry.
> 
> Is your usecase in upstream kernel? If yes, which DT file implements the
> usecase?  I guess it's im8mp-dhcom-som.dtsi authored by you, but it only
> contains the DT node for TC358767, but not LVDS panel.
> 
> Can you please elaborate about the failure case?

The TC9595 can drive an DP output, for that the clock which have to be 
set on the LCDIF cannot be predicted, as that information comes from the 
monitor EDID/DPCD. That is why the LCDIF has to be able to configure the 
Video PLL1 clock to accurate clock frequency.

For the LVDS LDB, the use case is the other way around -- the pixel 
clock which should be generated by LCDIF and fed to LDB are known from 
the panel type listed in DT, but they should still be accurate.

> You still may assign an accurate PLL rate in DT.
> This patch only makes the PLL rate be unchangeable dynamically in
> runtime.  That means the existing imx8m-dhcom-som.dtsi would use
> IMX8MP_VIDEO_PLL1_OUT(running at 1.0395GHz) as the parent clock
> of IMX8MP_CLK_MEDIA_DISP1_PIX (for LCDIF1/DSI), since it includes
> imx8mp.dsti.  I assume it should be able to support typical video modes
> like 1080p60 video mode with 148.5MHz pixel clock at least with 1.0395GHz
> PLL rate.

This will break multiple DP monitors I tested so far I'm afraid. And I 
spent a LOT of time wrestling with the TC9595 bridge to make sure it 
actually does work well.

> Granted that less video modes read from DP monitor would
> be supported without dynamically changeable PLL rates, this is something
> we have to accept because some i.MX8MP platforms(like i.MX8MP EVK)
> have to share IMX8MP_VIDEO_PLL1_OUT between LVDS and MIPI DSI
> display pipelines.

What I need is the use of two full PLL1443x (like Video PLL and Audio 
PLL1/2) , one for each display output, and those PLLs have to be fully 
configurable to produce accurate pixel clock for each connected panel. 
Otherwise I cannot make proper use of the video output capabilities of 
the MX8MP SoC.

> The missing part is that we need to do mode validation
> for the MIPI DSI display pipeline either in samsung-dsim.c or lcdif_kms.c
> to filter unsupported video mode out.  Is this missing mode validation
> the cause of your failure case?

I do want to support the various modes, I do not want to filter them 
out. They can be supported, the only "problem" is the shared Video PLL 
which is not really an actual problem in my case, because I do not use 
shared Video PLL, I use two separate PLLs.

I think what is needed is for the LCDIF1/LCDIF2/LDB to figure out 
whether they share the Video PLL at all (you already suggested the clock 
subsystem can provide that information), and then if:
- yes, agree on some sort of middle-ground frequency to configure into
   the Video PLL, frequency which somehow fits all three consumers
   (LCDIF1,LCDIF2,LDB)
- no, configure each consumer upstream clock to generate accurate pixel
   clock for that consumer

Something like ^ would make MX8MP EVK (the "yes" case) with shared Video 
PLL work, without breaking my use case (the "no" case), right ? (*)

>> There has to be some better solution which still allows the PLL
>> reconfiguration to achieve accurate pixel clock.
> 
> As I mentioned in cover letter, the only solution to support LVDS and
> MIPI DSI displays on all i.MX8MP platforms is to assign a sensible and
> unchangeable PLL rate in DT.

I am currently using Video PLL and Audio PLL to drive DSI and LVDS 
outputs from each, so no, fixed Video PLL assignment in DT is not the 
only solution.

> Some platforms may use two separate
> PLLs for the LVDS and MIPI DSI display pipelines, while some others
> have to use only the single IMX8MP_VIDEO_PLL1_OUT because
> all other eligible PLLs are used up.  That's all fine, just being platforms
> dependent.  The only limitation of the solution is that some platforms
> couldn't support some particular LVDS and MIPI DSI displays at the
> same time due to lack of PLLs, but this has to be accepted since
> the shared IMX8MP_VIDEO_PLL1_OUT case needs to be supported and
> the two display pipelines are not aware of each other from kernel's
> point of view.

Can something like (*) above be implemented instead, so both Shared and 
separate PLLs would be supported ? That should solve both of our use 
cases, right ?

> I hope that we can agree on this solution first before spreading
> discussions across different threads and eventually the NAK can be
> taken back.

I cannot really agree on a solution which breaks one of my use cases, 
but maybe there is an alternative how to support both options, see (*) 
above ?

