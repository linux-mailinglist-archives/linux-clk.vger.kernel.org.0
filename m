Return-Path: <linux-clk+bounces-5541-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C2899628
	for <lists+linux-clk@lfdr.de>; Fri,  5 Apr 2024 09:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C35F31C20FAB
	for <lists+linux-clk@lfdr.de>; Fri,  5 Apr 2024 07:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A703F28DAB;
	Fri,  5 Apr 2024 07:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="waSLGKA1"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F6225630
	for <linux-clk@vger.kernel.org>; Fri,  5 Apr 2024 07:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712300690; cv=none; b=p87Na8iipLfZzNE4DVRt2U7IIP+Twc3dMu+deMDjuoOmCvo5oHAohuYhN4HzOVfCxnykpfsnOz78XGS704px4EYngetlNE3SqI2SnrKfHfjKyBWJ0u/cd03iyobwmgTszH9WCCN7ox2cjj1pq7nEcqPLGhN9FbrSg+RkMNKcRQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712300690; c=relaxed/simple;
	bh=JNrIR5alUd3utRpEaAHG1wb4hAjlRLdSxaXh1dOEDIM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YwMTD8c20Kk1jSLFpFYFo3ldOdey8Q5Hq1LCXaue6FIizStmRKm+GI4gzqukiAkbOVzaMBrbbfRLTYCPWfx3uMYty9gssyuYhMJ1Tl8yQEv3e/r/E5R0bth4Uj2n3hEWQ+vbhabDZnsaUAT1W/1UpOJBPApC6l10LIHHaeGJtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waSLGKA1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3436b096690so2197626f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Apr 2024 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712300687; x=1712905487; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ck0+pssPiWzof/P+3eKb2RoFHftHMIJF3LhSjby3XvY=;
        b=waSLGKA1DQ7kOUfKAc/oyo1qhfT3RPKLMcskXjWM/GwrFyrRt7C5+JqrjyHVsnTiVB
         YK24JOmtNGhBoR+u82p4+ZM6d9pdEhXLG9UKQlWp0aDysRrYItOYR+I54fH4fbI3IXcX
         1NCViEn1a4IOcAXZL6rFQWx7Mq6XwgJKcNFJqNpb3XCLypbJnGo52AKdchCY92l2hBCN
         GY8yGTMecFrRuBNzx4qUi6fSVeUB1p2cr+Y/BvJDWL0hN114GouCidv7P+tYg/elNgE9
         2/ktceM+ADkETytrP9KhkSVvomD/6IfKP7So8GRnmUTQVtLFG0GigLeiljgc8AcLZpk9
         bCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712300687; x=1712905487;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ck0+pssPiWzof/P+3eKb2RoFHftHMIJF3LhSjby3XvY=;
        b=l178rnUCV+qKQqj+qI+iWf0kSFr6xf48DnHFuqq8WZfvG4cqnbaPjqg+4BtWeW/nOQ
         PZYuQu1i1pZmz+h/Ll+Nty6h9iVu6aUK/bz5IU9cvsVxer2FJSxZU+DGqtZXn92vbeCY
         tC8EDe9NvdJ/7JWspHCWXQNprrMf4zABPoU/JZ9+Jjx2gTiBPcCtguVx8x5LApLedpxq
         rZNX+UW+hmwsMJnS4xg2BbYaUDJr4QOC/Q43ggytCjg6nTFMzRaXemO/OTuEz99AXBH5
         LV4Wvh36XRu28yboB0xJqiEM0usE3yMuMMyvoOMfjZUCmCV6nCNAcrqaVF1yelZfMLTe
         ivOA==
X-Forwarded-Encrypted: i=1; AJvYcCWr8cLVxTOtJ2zhHLmMwKGyn6PqSCnMWM0BxIbaSAXg8htaYwZxXlEb7X7JuEfzAwae7T16aiYJ3XVYB4VjNdfOIS1EfS3awxxV
X-Gm-Message-State: AOJu0YyhnUD1y3DSPueCKmI0gcSRhTVXHNPrQq8XOnbq7dn8Ko5J9vEb
	lISO+SkiYNf2uyYwP691hMa7F/JqBpbBRSjfjNMvkz7m7/A8SgLZCcbEpLDzbDA=
X-Google-Smtp-Source: AGHT+IFTmsq/286Yc5zD2qEA6UxgJfpqI99lGS+nfprpglgj+BBT5krGkx7W6lXqCOGwT9UlqIdn8w==
X-Received: by 2002:adf:ed46:0:b0:343:8097:213d with SMTP id u6-20020adfed46000000b003438097213dmr1322402wro.20.1712300687376;
        Fri, 05 Apr 2024 00:04:47 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id n6-20020a5d6606000000b0033e745b8bcfsm1247138wru.88.2024.04.05.00.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:04:46 -0700 (PDT)
Message-ID: <95bcdc942cba564f78a6f2fe4cde892575838d5c.camel@linaro.org>
Subject: Re: [PATCH 09/17] phy: samsung-ufs: use
 exynos_get_pmu_regmap_by_phandle() to obtain PMU regmap
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com,
 chanho61.park@samsung.com,  ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Fri, 05 Apr 2024 08:04:44 +0100
In-Reply-To: <20240404122559.898930-10-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-10-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> This allows us to obtain a PMU regmap that is created by the exynos-pmu
> driver. Platforms such as gs101 require exynos-pmu created regmap to
> issue SMC calls for PMU register accesses. Existing platforms still get
> a MMIO regmap as before.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0drivers/phy/samsung/phy-samsung-ufs.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/=
phy-samsung-ufs.c
> index 183c88e3d1ec..c567efafc30f 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/phy/phy.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/soc/samsung/exynos-pmu.h>

You can now drop the include of linux/mfd/syscon.h

Once done, feel free to add

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

> =C2=A0
> =C2=A0#include "phy-samsung-ufs.h"
> =C2=A0
> @@ -255,8 +256,8 @@ static int samsung_ufs_phy_probe(struct platform_devi=
ce *pdev)
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> -	phy->reg_pmu =3D syscon_regmap_lookup_by_phandle(
> -				dev->of_node, "samsung,pmu-syscon");
> +	phy->reg_pmu =3D exynos_get_pmu_regmap_by_phandle(dev->of_node,
> +							"samsung,pmu-syscon");
> =C2=A0	if (IS_ERR(phy->reg_pmu)) {
> =C2=A0		err =3D PTR_ERR(phy->reg_pmu);
> =C2=A0		dev_err(dev, "failed syscon remap for pmu\n");


