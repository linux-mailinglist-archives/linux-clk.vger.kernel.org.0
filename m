Return-Path: <linux-clk+bounces-1288-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F45C80F6F5
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 20:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFBED281FF8
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A1E63576;
	Tue, 12 Dec 2023 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALra6ojD"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F175DC
	for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 11:39:38 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so46678595e9.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409977; x=1703014777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfIE14hL6Ep14FvcPfTlhNuMzd4StQYiUQOMVEI79FY=;
        b=ALra6ojD/61xoxpS6uNi8RHdT7wPyRHKf6+ut43ydhooTXFlV+Qs9/kjgP1W7j1Xa/
         wT1T6qBUaryZpvXfO9k2gdEu/o0PwjCExRbL6vnTgaGPEUbrx43QCtxd6AmcrqTsCpiV
         Ui+nNW3tBUQ7/xGnpmIfoVHNFevZVbKPm4/UuU5D4TH3Rd+9u98zbfi4hezQELQOoFGf
         r8U6l2blczi4KVk+KNaNW39i0GExsIebS/WUI6fUPy5T5nr2+0xKoZTUTRXoEwWFncCV
         cLJbAFMRTBkCGfGuazSL/DC6yhbg249xd1yug/UWFtENhMKcO+o573Yx70VfOkXgs7gg
         rOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409977; x=1703014777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfIE14hL6Ep14FvcPfTlhNuMzd4StQYiUQOMVEI79FY=;
        b=WVHtlQN1PXgJnBx2wlaCNwNGpXj/2waC2PtPKfJgovJ2h5/yKVaUsIszUvkzFD3zKE
         BRhmPRGfjME9NQwLddnaQhgGJ0APpzLD0HiR+ILFC8dv2Qy5vtce18GpQnmOSwH2/eIU
         4fE86VJx2eJq6aMOAAw58wzEE4/pZq0osFsP+yQi+iLv6qxSgced8bm8ELV1e4D+G8y5
         aI2ds0zFg+dCalSl9z8TdNPUgtKnfBUfL+wEfcN1VuQdJs2A67VonxzZ774D67/tlGv5
         G6H6WMTSmz6gV249G2otxeQ44NPiP0ZIIDGzW+hcLvi4hfcRfaood35WQF6jZU6c9MYA
         ABoA==
X-Gm-Message-State: AOJu0YxEsmHjmew8XZRiOmEQAMfqW2m/DFsQ6fbMlu0O3AUgeejTnYu6
	lN9NJ5GB1aR6xXvONl3sbYHjRA==
X-Google-Smtp-Source: AGHT+IFWZYXSA0jeqrFGRPP0p5X1RtlD1sQyP9vBTipqUAYQV1kqPm945kUXEvHmP/pUg4PI+y0ClA==
X-Received: by 2002:a05:600c:21c7:b0:40c:2c6d:c82b with SMTP id x7-20020a05600c21c700b0040c2c6dc82bmr3603964wmj.60.1702409976898;
        Tue, 12 Dec 2023 11:39:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: Re: (subset) [PATCH v7 07/16] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date: Tue, 12 Dec 2023 20:39:16 +0100
Message-Id: <170240988142.242356.3792346192498410733.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-8-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-8-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:22 +0000, Peter Griffin wrote:
> These plls are found in the Tensor gs101 SoC found in the Pixel 6.
> 
> pll0516x: Integer PLL with high frequency
> pll0517x: Integer PLL with middle frequency
> pll0518x: Integer PLL with low frequency
> 
> PLL0516x
> FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> 
> [...]

Applied, thanks!

[07/16] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
        https://git.kernel.org/krzk/linux/c/13ff3bdafdd569e62e59330de18aae25ec15c97b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

