Return-Path: <linux-clk+bounces-29765-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5BC0444C
	for <lists+linux-clk@lfdr.de>; Fri, 24 Oct 2025 05:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8AE19A6ADF
	for <lists+linux-clk@lfdr.de>; Fri, 24 Oct 2025 03:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6940E26F2BE;
	Fri, 24 Oct 2025 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7bmDer0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E311D26560B
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761276993; cv=none; b=jEqybq0fNpn7J8eBXvePl2tGkCUQvOJoEXW+KTMcC3euiN4wlY/3Z2bbP50jFr8yvVlcgXGIemVPrmiE2wk2gZhE930/i/Vdyp1d2es/y8eVh5jgA+biec0qzidVic27hxTvTDbYstpJ4WgQUpEBakw9mxJdUhDLQ41aaOPlADE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761276993; c=relaxed/simple;
	bh=BXg+mCHVidA9iZrXn9I516cQrbPXuicvfr+PM6FtK0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdAanR8qeNkfMTaSwb17IG4t3TZxt4GBpjbS6q08qi1Iopgh4AYvzclywJHe/D98IEdXeqPRS6RklXQMJyU8oqw1f/GjZDTIZrg6iwb/mvkoNUh4TjIMdUETHa2G+ILJOTFpbxvhv2M5ruJSOAdzeBJ46AWdHyhEKuuTrX62pnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7bmDer0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3307de086d8so1632238a91.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 20:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761276991; x=1761881791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlN5DvyH2+GBtNgIhKU58Oi5/dzl5ldvweXQc1JJd8Y=;
        b=d7bmDer0MDSH/y2XqezOCVSCO2++raVRqfBkcc5qYGQouFTD7B81CdRVRJyClwxCcg
         bdIR9UezSc1S0ZFE9OhQBgqXcavCVVfnUfUddviv3lVKiC/Nu654xY+xMY11QUTiW5uc
         O7ewfUDVNnHGEzptij6hDyJ8FDKZILj3fkHT2yrba4FImAn2rBvHyEpeZ4C5vnv6XMVx
         Az/BxMt78k1MmezUUR/EXrudw0BYqzYWN+PzvEb1tH5F6EadHds0sJdE3fKlld8a3Ieq
         6M0jpqq5Lr2T2NIlTQDEmGVCsaTj6jJwd8t8ODbamZwCCPWtKGGV/chhngvaCOCAIfry
         Y1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761276991; x=1761881791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlN5DvyH2+GBtNgIhKU58Oi5/dzl5ldvweXQc1JJd8Y=;
        b=Hq4qtSgr1sNAzf+r9vOf2dBDKu3qmNgvT1RyhhHzw4Hhc9/c3BEbLIIpNF+d9cbUs8
         xSbVAE86lVvNLa/9MsqonOERJ8fRJNujnqmTUoG5uU+J5NCelZwEJC4wUrFkfr03WIAC
         KatVWyUfyr7+jCrnQ8VhPYPbcRg06n6IJRtF4FcdFTJF7oHYCSfIUyW63i65lVlW/ADg
         tHDT3wXdh2wHpOys+nVQNZFXcZi2RWShxmzHWr34F3rQgG9+2feQb+nt4rB7bhO/amW7
         GR9rMB0Cc3QspYu/s6kMaot6iN9a4JXU+Ky54arPM2lxRRPd6iZwAyzKcRW/meCez/1e
         F+VA==
X-Forwarded-Encrypted: i=1; AJvYcCX1hBG/xTy36EDpp9Vz3ZtoDVsNx1Db0H38diYEuB2tJbk73vKHD8/lGtJ9NWc211MYw1cA5etKwXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsq7pP35DGzm57hVqePRgkHMguhbSe/zLcZb1orQqSrTqWWLCM
	zSlcZPnBzVP2CjhNWMWyjvHTlNLG83VFlYQY1Rp3EWIjV/LxmEFD82nRfjjxiVOnbL8PxnYQuTp
	irUh7O5Ck8KnOE9Fr119ygK6YzZIIZEY=
X-Gm-Gg: ASbGncsWD9C6sU6yuEdqbFgBGfTczgYN096xG27VrMcA2t8VVxP6Nk8UaaTYnkEeqQo
	bjFuGPwa/3fV91Rr0eCpmo/X3RzzQPVOK+70drz2c243lgUIhkLkJDV16bzhn4W3G7b7txjufZ0
	H8M7G4xDj3axzJ1Scsl2Smlej4h5MrogkXLcOWx+OMpabmBwUu1z9LzWhVCQ5hNOYgsz7B5Z4pL
	lnXnrjm/D+t55GihUcRmK6525BroB/9NRbg/Ir4eQP8YOIZyFzHf/lM199H1D2UCvP2oFw=
X-Google-Smtp-Source: AGHT+IHmAjQXW6oneD0rQyql9NZfZkZxeQX5ygzBPkzltdafT4YRRH8XN5RuqvianxiGov8Gjv/rIG5Ew31uUO9ltuI=
X-Received: by 2002:a17:90a:e708:b0:330:7f80:bbd9 with SMTP id
 98e67ed59e1d1-33bcf9202abmr28546749a91.31.1761276991065; Thu, 23 Oct 2025
 20:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 24 Oct 2025 11:36:19 +0800
X-Gm-Features: AS18NWAUWGWX5ZUSW4jhS3wlXEPW7gKSGrcNhdPOEUHBjtb-V-Oq2o2RBvRxgdE
Message-ID: <CAA+D8AN=Q7-b-SxfziJqsk1T-yNxw+VnOPAGsQhXh68e3UpN5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 7:22=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
> "memory map", the definition of the EARC control register shows that the
> EARC controller software reset is controlled via bit 0, while the EARC PH=
Y
> software reset is controlled via bit 1.
>
> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MAS=
K
> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values woul=
d
> imply that the EARC controller software reset is controlled via bit 1 and
> the EARC PHY software reset is controlled via bit 2. Fix them.
>
> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more r=
eset bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu wang
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 6b357adfe646..eceb37ff5dc5 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -14,8 +14,8 @@
>  #include <linux/reset-controller.h>
>
>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET      0x200
> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK                BIT(1)
> -#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK    BIT(2)
> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK                BIT(0)
> +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK    BIT(1)
>
>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET    0x108
>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK      BIT(5)
> --
> 2.43.0
>
>

