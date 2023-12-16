Return-Path: <linux-clk+bounces-1543-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702A815B62
	for <lists+linux-clk@lfdr.de>; Sat, 16 Dec 2023 20:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB3EDB21703
	for <lists+linux-clk@lfdr.de>; Sat, 16 Dec 2023 19:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9CD321B5;
	Sat, 16 Dec 2023 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="J6dUi0z8"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192131A9C
	for <linux-clk@vger.kernel.org>; Sat, 16 Dec 2023 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EBA873F184
	for <linux-clk@vger.kernel.org>; Sat, 16 Dec 2023 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702755555;
	bh=2c7dacoDuG5K0tl+4E3IQI93Dvy5OouinIjtAewN7Os=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=J6dUi0z8RXb9y/LaMdfbLe1HW8+KwMBDyPBg/Pl61TOAlpig9gRbl2mos7D+3iWCb
	 oSwRUWcyYkfmQBGZRZVu/ou+Ru0PMS1QGI1vrJMKGQxi9eHhJI+Q4o22M8Ou7+vMZF
	 +J0Mh3g94WTd6+CSdvAuvc4nP02xbIpHg+hqbLwfOdPwmo2B/ChVQnD2CSUOR+3vZp
	 aQYUiSTHvPUUmNDiD2LpAMRjx8kA8MQL+LcrslbkRq5EkPjrgLGfLaROvkI74xlEpp
	 VSjCQf3yBC3gxWOlVfeFTwcY6RvVzDiyF+yFH8fryv1pQPt1sqaksvN8J50H9/YSWp
	 IzMyjfoK0QGJw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4258a2540ceso29059801cf.1
        for <linux-clk@vger.kernel.org>; Sat, 16 Dec 2023 11:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702755555; x=1703360355;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2c7dacoDuG5K0tl+4E3IQI93Dvy5OouinIjtAewN7Os=;
        b=uuBq9fsk08cToeKKakGmnnbRNHXLiDQHOHib4CCwW28wllpWm/y02S+hqhSKOKKDEF
         Mfi80WF17Z5EwqoGziJaicLobLiABIQDZBPIlGerYqwunWHPLuyh991lQd+/W8poQz0Y
         PHi5fbwlJO9SBzZaZ8f9HsN+/OG7VbKslv75ijdFGLgyqsF1i6uVfVP2iPYc5fzK2oMN
         SIDlFtw4rhqV8SsuJxtTouAJib5kBIiHozLvBW01kT0K2bSGpI6juH1w1zJIOwUzbIO5
         tMTM32hWmX/FoRRIi3tRO5q+qaRbc+jgLvdseMIxW1rVZ7KjXCU0KSSWQr/9R++EHFHH
         phSw==
X-Gm-Message-State: AOJu0YztrsJF5U+7BQUYOEFZSS9FoCcEYIIL6TGRQ0vkC9dM0FLdEpmq
	FHLvwe75+oVd1X5MbxAwauFLPISb1W2Vn6CWEfwuyblijUOumEJj0qQ+bZwFaN5fRPSi3Howx9k
	Wu+SYRdPJsJi0ZHJKUAJiASG7PLzZwSjdhCgvLDU4nvhAIcQu2x+dTw==
X-Received: by 2002:a05:622a:1c8:b0:425:4043:18bd with SMTP id t8-20020a05622a01c800b00425404318bdmr20333338qtw.112.1702755534007;
        Sat, 16 Dec 2023 11:38:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkdKr9ZA1ECc64gwyj30qjy4snj5vZUkODgrjSVIiFsMAP3aqvVWnQrSXJixVzRgLW2ZfvbY5zJh4SCWF268k=
X-Received: by 2002:a05:622a:1c8:b0:425:4043:18bd with SMTP id
 t8-20020a05622a01c800b00425404318bdmr20333325qtw.112.1702755533644; Sat, 16
 Dec 2023 11:38:53 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Dec 2023 11:38:53 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com> <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sat, 16 Dec 2023 11:38:53 -0800
Message-ID: <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] riscv: dts: starfive: jh7100-common: Setup pinmux
 and enable gmac
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"

Cristian Ciocaltea wrote:
> Add pinmux configuration for DWMAC found on the JH7100 based boards and
> enable the related DT node, providing a basic PHY configuration.
>
> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index 42fb61c36068..5cafe8f5c2e7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
>  	};
>  };
>
> +&gmac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac_pins>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&phy>;

I'm not sure if it's a generic policy or not, but I don't really like adding a
reference to a non-existant node here. I'd move this property to the board
files where the phy node is actually defined.

/Emil

