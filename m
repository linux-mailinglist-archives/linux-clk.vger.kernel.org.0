Return-Path: <linux-clk+bounces-26374-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB9B2D532
	for <lists+linux-clk@lfdr.de>; Wed, 20 Aug 2025 09:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E28F1BA70BD
	for <lists+linux-clk@lfdr.de>; Wed, 20 Aug 2025 07:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB8B2D6E5B;
	Wed, 20 Aug 2025 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="fjB2SWgE"
X-Original-To: linux-clk@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887692C11D1
	for <linux-clk@vger.kernel.org>; Wed, 20 Aug 2025 07:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755676324; cv=none; b=p9mwvaYOi9mWmNBOyim75MSMw62VudnPg+4K4QxXQo7AyrUIn/7QjaqlFknXsVTiPUU50NUvPqvPPBMhaKAkIKdcQSENRXHPRM7g3KSjGAxf80dbM4pIb/S7Vp7z1taowz8N+YwQTzqo1DvNSv8GENl0iFlCwoqCJdad5m8sb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755676324; c=relaxed/simple;
	bh=elLLSuyPTheoaJ0MPlpkd6YA8BTKoQCtubTKZJG4wWg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QG0WPJlWgVPv1OYvKVu9W50WB9mx87bj9x+iidBgUZXjLhzV5hGPK+yxT/a5Le8Hx7P4SCWjBcj+voCw1pPNl3RdzIv33jag15MUp/3AO7VwQyPavOEM8vRC7R++hHp9/rACLH0U7M5t1ewe2pTDXZdcmdHMMKXmQJgOeyU/X9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=fjB2SWgE; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
DKIM-Signature: a=rsa-sha256; b=fjB2SWgEt51cTCOpks9gjwooiZHQ9M4zvI/RLb67ZDFZclKxRMkXHIN2pz4MhKf3jv4LcUxEDH3cz5pPt7qBOakfvNliFjxHToHr/tLIa8MC6o4tOD9+ymwb24SlBB0X451Wp1utLcUKwexwyxYovgik1qlJ9gq5/9ncClmNINGy20tqF9s3DILsBWGWFfab5CG4e0uJz1be1odFQ9mDPGtyKrCPZ9At5+lxGIuseEYDncH/0zNZfoi7BS35NpDx7lGeRny1zNZOivGXmUatSZ3dkrtQm6U0ok/mr5/G3QGNxyB6+xxGSIBpR1cbiPKj8wmrAXZBalmW/Yri+MUA5g==; s=purelymail3; d=purelymail.com; v=1; bh=elLLSuyPTheoaJ0MPlpkd6YA8BTKoQCtubTKZJG4wWg=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-clk@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1035053768;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 20 Aug 2025 07:51:27 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 09:51:24 +0200
Message-Id: <DC73AUJUPBLN.2ZN5PDNUVR33L@mentallysanemainliners.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] clk: samsung: exynos990: Fix CMU TOP mux/div widths
 and add fixed-factors
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Denzeel Oliva" <wachiturroxd150@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250819-2-v1-0-e84b47b859ce@gmail.com>
 <20250819-2-v1-1-e84b47b859ce@gmail.com>
In-Reply-To: <20250819-2-v1-1-e84b47b859ce@gmail.com>

Hi Denzeel,

Thanks for your patches.

On Wed Aug 20, 2025 at 12:19 AM CEST, Denzeel Oliva wrote:
> Correct mux/div bit widths in CMU TOP (DPU, DSP_BUS, G2D_MSCL,
> HSI0/1/2). Replace wrong divs with fixed-factor clocks for
> HSI1/2 PCIe and USBDP debug. Also fix OTP rate. These align
> with Exynos990 downstream cmucal and ensure correct parent/rate
> selection.
>

[snip]

> @@ -837,7 +837,7 @@ static const struct samsung_div_clock top_div_clks[] =
__initconst =3D {
>  	DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_share=
d0",
>  	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
>  	DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_share=
d0",
> -	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
> +	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 1),
>  	DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_share=
d0_div2",
>  	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),

As per the downstream clock driver, PLL_SHARED0_DIV3 has a divratio of
0, 2. Was there any reason to change this? [1]

[1] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9c=
d22b89ba3cc8282945a0c46ff27341d/drivers/soc/samsung/cal-if/exynos9830/cmuca=
l-sfr.c#L3935

Best regards,
Igor

