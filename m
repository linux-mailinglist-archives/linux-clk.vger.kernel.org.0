Return-Path: <linux-clk+bounces-5314-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5346A8952FF
	for <lists+linux-clk@lfdr.de>; Tue,  2 Apr 2024 14:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E612E1F26175
	for <lists+linux-clk@lfdr.de>; Tue,  2 Apr 2024 12:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A040D58AB0;
	Tue,  2 Apr 2024 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcFkuFOJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E672D78A
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061109; cv=none; b=RKQtYJK6JMmObX8T2Oau+21VKTUpvh31g9NdXH7IfzmZv+JfFEB0oRenka7/KP4NN23uyhFkIeWvssABMl3FZa0mdhp6CzkgXWg9jnLOO7ddHmPzX2ETobkFhXx9qmTpZ7Xv3Vq59esN6Jw9cS1MHeVMA5A/hbV2KCnaXRz/8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061109; c=relaxed/simple;
	bh=p0a8acw+7ULihTf8lE/ghLH059TUPnJn47JiEnYgccM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgQS+pGB2zEiNtYHM0BrSo7Gbj3TA+NHn9jHiJnDW/AuVJTSZ/Vlp7D9+QxdMEF9Tt9STQcbvio+jm1SfqbxKVWOlqGLtppDpbu+GlALtm4NVM32mdR9J/ZsyIy56aejG2ZZrXgRc/NODcMvsAme2khes4zHIks7iECbKVHZ9GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcFkuFOJ; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc74435c428so4878985276.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712061107; x=1712665907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0a8acw+7ULihTf8lE/ghLH059TUPnJn47JiEnYgccM=;
        b=AcFkuFOJwh6/OSIC2P6CN+t5N8yM49Tio8HVEsm9NC1HNJCNNVgKc2/Dkb3jTefFL6
         SeBWPt1GUPkHUPEA9RAVg6Y+DQem3a2hYwXwjdeecWrWv1EQEpH1aiq0vqDRzLrTDWLD
         1qUj9oYWttSSh3vHU7vuM4JujJOGMQU2euPPH0oeogAB0iOKUCfie3ASXqXjXmrOxYfH
         zU+INEwdROhwLAR4DP9QoG7ndxdwbChFbCZ1efkgoIr88olR6HnpsCdY87zdd2smTu7N
         95DuzmryhyQFqmoxoACsUTZSFgUpsaITa1qGf6PmP71lC3NJQ3G4i7kG2ZqihM8JjY2+
         MWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061107; x=1712665907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0a8acw+7ULihTf8lE/ghLH059TUPnJn47JiEnYgccM=;
        b=qb41Q9GmVG0XtaKDlURHbcwwKc8xkxlmvBdgLaaR60Tt0aSj8/Y+mvah31fw48yhjd
         D3rzSfY/oosbgu1UAJ0X2xLo2dENfG1ejm2ws8f6r1OBqCOkl6wRw90A1hZZZgvbbv+Y
         3H0o4TIFiV8U5wlh78Vpt1uaGnk+ULtgPjvpkj6KwmdH59dMlDawPp1o2rni5OXp03uW
         m5SZRJxARJiwF0WtjcoaQ53e22BFh4P+cjD4pqLPF4BxRCl2xe/0aSvBTziENyN4Rfjq
         WHEjXYoyn9+GxvM88wY5Kko5AlzIKRCvfGSTv9R/Zw6lPPaEA4PvX6h5p+fgvuDUdMeE
         01mg==
X-Forwarded-Encrypted: i=1; AJvYcCU9EFtRnkICG5RgvJQEb81qIqZZF2Tw96JYk9+0GLWRvd7s8PMKYZcyGA+emLF76YQa1PE2T9765bt/To5C7eNhqBgQB3jw98Xb
X-Gm-Message-State: AOJu0YzdOPOXpSu4hx8G2qOP0hywUD5tY14D96E6qsR4mT3g1ZFbVS3M
	4o+xc+i/4gKNeusOAtjg8kislnpC+MiW1ywlL2MphL84MqapBFbH+yPaSHxoPvMNtvRTG92g7uq
	AGL/ECgnhJpqCLqi9sJM8ZeUursgdf93ZE9YhhQ==
X-Google-Smtp-Source: AGHT+IE0J84TqRbakQrC6l14h9si7x2di9LmRSJuCIgA2LQ8vJmxYu7A/iE7PWTtStw1Hw8SCsS1GQo4L/akposnPKg=
X-Received: by 2002:a25:a14a:0:b0:dcb:b3dd:4f95 with SMTP id
 z68-20020a25a14a000000b00dcbb3dd4f95mr10698210ybh.43.1712061107020; Tue, 02
 Apr 2024 05:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com> <tencent_6D10A9C63E3E0F412EED33477B5CDB98C207@qq.com>
In-Reply-To: <tencent_6D10A9C63E3E0F412EED33477B5CDB98C207@qq.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:31:36 +0200
Message-ID: <CACRpkdY1wpGM7M5QV5rN0M6JMN_yugQJ7CEtnQjzsheD5AT23A@mail.gmail.com>
Subject: Re: [PATCH v6 08/11] pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2024 at 1:13=E2=80=AFPM Yangyu Chen <cyy@cyyself.name> wrot=
e:

> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already on the mailing list [2,3,4], we remove the use of
> SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,
>
> Thus, we replace its drivers depends on SOC_CANAAN_K210 and default selec=
t
> when it has the symbol SOC_CANAAN_K210.
>
> [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@ker=
nel.org/
> [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0=
a@spud/
> [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46b=
b29@spud/
> [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655=
a4d@spud/
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Is this patch something I can just apply to the pinctrl tree?

Yours,
Linus Walleij

