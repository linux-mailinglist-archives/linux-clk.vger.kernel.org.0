Return-Path: <linux-clk+bounces-364-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D55627F1EBC
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 22:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3208CB218E8
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 21:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93914374FF;
	Mon, 20 Nov 2023 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWC0kgtE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94768D2
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 13:21:11 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b27b498c3so1243495e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515270; x=1701120070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWrC3Ayxx8cA3cHGksIcRtfk+Sj+TKwgMP3l+aAP0Uw=;
        b=DWC0kgtEj1B0sU2zmF37ICAi8PFRdyLJN3Zy2Z62y6rFr5swCLj0USe4tAXdnaBpCV
         u6DcddHyqa02SUNjjyVxHgRE95OwugNFZem1eNX4vfNzmYzgF0/bGB6S2rN7uoKkrvoM
         zPBZJ028DwAZPHhO9lpFedJE4hw/KCG2I23GTvl/mVEw9Lb6fLJb6EqTT77WoccC+SEa
         df5irjBm5kfY4ROUikT7j3dwt8dUeczfzFppkOGrZ3yIUViSzHy4al/YAhP/jgv2nbuF
         G3yBYG/kFRUva+5qpY5jpF5EyZEMZpqgI5LLfIBWiE7ta/Xm2kq/SujqmFOePoorm2/S
         X8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515270; x=1701120070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWrC3Ayxx8cA3cHGksIcRtfk+Sj+TKwgMP3l+aAP0Uw=;
        b=RrdRGcAxcQIgFggXV02zpkkjIGKng4XlR7biN6DmZP8ci0Jjb+L0gfXkwi8Td5Ke09
         WkcYNdEbAgS7H0LT/EIvXsjFElPoilAoNdYGti2/0/m3E8uoFkvXULDQIh9iVu+vjq/a
         S2/f46ZmZgwM5WrR6sl3WW4ORKFO8+CT838tTSuo1uF16V51urhw56wV2Po7ErWgR88t
         +HoUkrTc+Ggz7XC66/RJTJCeUJth6OaaLp4gUTzATFJMAeTKxcC3vTJSyk6n6URB42F8
         ydPFtWKv/XEA8+W6wVVW4xQ9fE4+LwCtsQN5KbN9sKvkz4mv6lFaiGh2rgnZf4ilDDFa
         JEGQ==
X-Gm-Message-State: AOJu0YxKmf/7GQ9du1GKFebz7fUWZC+O33OD5rBEkgkxFUi6fEXcCMXP
	BJi5Herle4B221rTIOnW8Y3mDQ==
X-Google-Smtp-Source: AGHT+IHvnqFqvnhoaj/lvHGCgZoD7uJel+Q84X3YFSUkXyOEOaLu5vJ/ZWuBo/wwxVo2wIMuvSsRCg==
X-Received: by 2002:a05:600c:4797:b0:3fe:1232:93fa with SMTP id k23-20020a05600c479700b003fe123293famr6449271wmo.22.1700515269893;
        Mon, 20 Nov 2023 13:21:09 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:09 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
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
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
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
Subject: [PATCH v4 03/19] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date: Mon, 20 Nov 2023 21:20:21 +0000
Message-ID: <20231120212037.911774-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 2de4301a467d..127f4ffde76a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -22,6 +22,12 @@ properties:
               - tesla,fsd-fsys1-sysreg
               - tesla,fsd-peric-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-apm-sysreg
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-cam0-sysreg
-- 
2.43.0.rc1.413.gea7ed67945-goog


