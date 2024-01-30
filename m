Return-Path: <linux-clk+bounces-3085-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4851A841FCF
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jan 2024 10:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BAD1B27B69
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jan 2024 09:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39813604B7;
	Tue, 30 Jan 2024 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FSNoKLvy"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6759159B49
	for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706607087; cv=none; b=caWxUN8tPMZrmzvdJFnXBdNbX2CL5ew7Pq8P3+BaaKO4dwGxRFvjHRgQS2YA+RSLHwUf6/MwUr3EcdCjmMYkFTLzIfMO66Nrr9UCPXW9tNkhwE0ncMZ6mwbbwX7JykgvThNtj8ZkjAk6oYhpeOVM66kxcgdCGo+cQfy6cPHd20g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706607087; c=relaxed/simple;
	bh=XYx0s0X4N57mkCoKTn7uq1S0HzyLcLKx4l9yG2NJoTw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D0faTy9XME81qjnPLMAzr2Mg40V4Xrf9QWick0d074LkgUOH4kPq3kz4UxYydWTjOfNUSEpJp2kHZa9xHrKcQOcs9WlzvplcasQKETC4A4WtqSCGrR0uVnuTwHzXVxpepxQEgeNxAIlRDKTmvEixR63xFiu0+aMe/XIHO/cKE28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FSNoKLvy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51114557c77so2000595e87.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 01:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706607083; x=1707211883; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XYx0s0X4N57mkCoKTn7uq1S0HzyLcLKx4l9yG2NJoTw=;
        b=FSNoKLvye6bBhZZNYpBh/KbwH7uMI5bx7ZbW0Mn/GclqE5dUexRET+cs0kHa5efLvS
         1C0EQIpnfAIAWAfyvLTy3k3u791A8woTVIGGZaRklDYlEmAWZ9xroApUcvdfGGDNG/Kx
         uqqS2h9w0dAoc1IDVwxw+0DOSJxxi1xebKNN3lhVEiv46jqi4WTwKDCorfJAiTX3xgMT
         Xpsq7NcY4/2NVaQ66KU0dwd/7ldVubWr0GJYzJXOkgfpspbq4YxRCNQeDftrDWS5Lovi
         MNalSZMtqkO28hrFqr9uV0E6RX2GP5AXT3HYK+r5ApxYbSN4v+0u54g6QD4xefIIzMB8
         3NDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706607083; x=1707211883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYx0s0X4N57mkCoKTn7uq1S0HzyLcLKx4l9yG2NJoTw=;
        b=FF947yxpdUt2rip9LsFjMA1T5sw4BfTlEaHvPERdcSOfUuZXi56mDTU4K5GcjWR8z/
         FuA4SWRu8pISC+yCr9kbfw01rs2eryG/LLuq3ZSLANslSgGUjPStqc9BSHQrfw9IYnt9
         QNlRrbGalHGT9vgTZMbl/4J4huSv0Hjjl/Nv66mJ9HS8Cm1YEz0AyG4JcwvElVVQjd4R
         qzBNzAgkN+7Dvqd+V+sSvm3X75FK5aCDX2kN5TxlumHYNREpnQ2680XVoVlRsWofk7Vp
         ZpOeAJXZ7YguKgsqbKTVzfP01sxZDGLhGnmfywLJZo6TOjJIjiKj0m7PAXaTnA85DMBC
         6slQ==
X-Gm-Message-State: AOJu0YwVBzKEDLgUbA043km/iC08pCUd6A6K8XuMj/7VNjKQu02T9cYj
	PvPsY8CVZ7AOpbNh36q6c892wpq387jCPLFlW+zUTCyIKu1+iRcjotTtxQsQOS4=
X-Google-Smtp-Source: AGHT+IH73ECOedOmbLboh50bSkCcm9bWbbIIdQpZY7C2yF6U75+RErqJaRRYI5LoY3XIRMWTRBDv2A==
X-Received: by 2002:ac2:4208:0:b0:510:293e:83b with SMTP id y8-20020ac24208000000b00510293e083bmr4843330lfh.18.1706607083413;
        Tue, 30 Jan 2024 01:31:23 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c1d1600b0040ef95e1c78sm4452775wms.3.2024.01.30.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:31:23 -0800 (PST)
Message-ID: <bbaab3addf958bc1f484a20ee0bdb65af05cf5da.camel@linaro.org>
Subject: Re: [PATCH 5/5] clk: samsung: gs101: don't mark non-essential
 clocks as critical
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org,  willmcvicker@google.com,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com,  tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com,  sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,  devicetree@vger.kernel.org
Date: Tue, 30 Jan 2024 09:31:22 +0000
In-Reply-To: <CAPLW+4kSka+twSoZmQeMsh3RWermrGG-wyENrr14AmX3zZ2eqA@mail.gmail.com>
References: <20240127003607.501086-1-andre.draszik@linaro.org>
	 <20240127003607.501086-6-andre.draszik@linaro.org>
	 <CAPLW+4mL1gb_R8PhKaMhwOUTa0GDqat_9W=348ScYj+hBarQJg@mail.gmail.com>
	 <d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org>
	 <CAPLW+4kSka+twSoZmQeMsh3RWermrGG-wyENrr14AmX3zZ2eqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-01-29 at 13:16 -0600, Sam Protsenko wrote:
> That sounds reasonable. But I wonder if that bit (about making this
> clock CLK_IS_CRITICAL to make earlycon functional) can be documented
> somewhere. Perhaps in the serial driver (earlycon function), or
> somewhere in device tree bindings? Because otherwise it might remain
> an arcane knowledge and people won't be able to use earlycon later.
> Anyways, for this patch:
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>=20
> and if you think it makes sense to document the bit above, please do.

Will do on top of
https://lore.kernel.org/all/20240119104526.1221243-6-tudor.ambarus@linaro.o=
rg/
once that is in.

Cheers,
Andre'


