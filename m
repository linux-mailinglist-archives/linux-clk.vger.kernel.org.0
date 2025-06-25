Return-Path: <linux-clk+bounces-23601-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47241AE7BCE
	for <lists+linux-clk@lfdr.de>; Wed, 25 Jun 2025 11:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D991BC7B8F
	for <lists+linux-clk@lfdr.de>; Wed, 25 Jun 2025 09:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB4B29E0E0;
	Wed, 25 Jun 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2PeihSqb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA26929E0EC
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842752; cv=none; b=tqsccxsjwo15hnQg0VzFQkha9ervTAWtsm84y9dIqSMbX++nNUC8U6lyKEVxgsZWL+Fvvg1M1b+8aFS4jM7EY1LjNGgSyU9h+ueJuLcH3ipSDC04UvpUa9herju6QG8TCTw+rJF+vWPuS+63hKpSnTCQ88BU2tQr4Zh5el2mySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842752; c=relaxed/simple;
	bh=zDunNlLlGkt8vOOzGrRzlhaxzDGdivSnyWKJOtlz/jA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kQFYjQKsVwtuqAKaa/Ms5xBDqXTMSZF1aEClCRkavlLon4ZmsGkfATbk/9ZbzqEJdv+pa3IYByoer1VNJp4+vqMajgivoBdgwklPUrE6u7wrcvmLmpCC89GTsBCB1dayymLkhkVHkEm0yKWGC1YPoJkCr71qMl1Mjm8ndD2WeI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2PeihSqb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad88d77314bso277611566b.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 02:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842749; x=1751447549; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5z3wkyF9OazYou1/TQSNuq1ZyZd9oZqbtIQWwEzSr4=;
        b=2PeihSqb6NToJFWVvlxtzktl9kFbRUolmcJexxjYgVUfU9st5/QwBkKr6Fym7a+P+J
         wRcbRqzkzQuUuS7TU3yjOKcTIeEsR7huog3dNQaNT/X0cYuEK9fv9jnmocwY+zUudsc+
         n3rj64XtlF7HIGUDVt8WwFjH+0by6WtW9IGdE/4B2mNVN2P10iSQmGWqs7iDYDonLxvf
         C9xlYLKGS5zHglM54m/ZaYU8m0TuH0Gecp6CUCPRChpFrEFmh7Xjl8HmXUxY40ZLdkyp
         4wzicnE6orokMFj12SVj6883D7BWPP8GsphLbk/5oYk8zDVxKsjPa7YzFuSXxSyY+Zym
         XN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842749; x=1751447549;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5z3wkyF9OazYou1/TQSNuq1ZyZd9oZqbtIQWwEzSr4=;
        b=JRWOIUJIp6OVDcxMaRKMNFG8FAKwBe9FeMk9N7oEL/dDAttptzACMGL5J/T0TMEQjB
         fwh5jP15sd0+q2/d7/YneCGqJlKcK0L+aqIzvVgie1uvZAMnofD78ORmVr3wPyqMekOn
         1rPWkKbmLu759qLaJFqT4C+QfQnJ2enS1rb0d7YC0K5ZS3zsMY7cwBzV7JsYQ8s1/s1J
         sZLRx7BksVcSz5xuNC1gOjy3GeeeNly6J4JCLyy/4F7ek0uH1/H1w3WVsps9c1XJNbzV
         xi6msUNn3s4rAnnPxeMqI+xAE11rlJkz1bSIGbJj3pJsESXCS0SgdIlqLt7cl37hVV1s
         +lVg==
X-Forwarded-Encrypted: i=1; AJvYcCWflG1ye55Q3s5soHL9W2JdcCfIs++tdow3iUXxNG2pms7e7LZfpXloB8roB6GqS3HOrLc0AozwnQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLo5WmwqdwhhUoPqVkUbQV5tlwx1vVEfgfcpg2+xJFx3RMXPYS
	t2bZQrU9hBjCvdFragdjdmCJRM6ncn03b4F2zKUMF2yjBuCTvwhfjlfirVYF2u02hg4=
X-Gm-Gg: ASbGnctmWZS4HjmpbBtJIHE1yQb5LnXD1blciqbr5aFO/PYxHuk9SVSCTxMu9tnj1q+
	9aDk0WPELVVCQkgYACvcWBBciCsWxMGHuexhuKO4n/mKMYNavHikRa7G3FdhKK0rsO/l4SjgtAI
	/uxRY66nrWN260MDKVPRZpuXT+v1073Aggbc/mrhIGGbbNUzxMtdIH7blY8O7Sg5wxQZ0FMnOeP
	gxZK0u07LQqO4t8NpmHLkeyFiGlxOKEHz95PNPfmFVLUWyfzUQWpF2B6EGE0CK3Gg8hshKMJuaL
	CbO5y6iI0W5yiQSJ1ra9+hbwqMfFL8TJ58oB80NX2mauVgg5EuLDqaZmF1AIk4lwnyZj8bWKzMf
	50zxMOC/Yhdt/gz7wDJ3gyGMSy2lLP1qe
X-Google-Smtp-Source: AGHT+IEC04a2DZ2PCliSz9fReUVSQylm1KEzVDyy0EZA3m9Nk30FaRett3cbuZNS7miWl19TY4ffig==
X-Received: by 2002:a17:907:3ad3:b0:ad5:78ca:2126 with SMTP id a640c23a62f3a-ae0bea7f107mr156327066b.59.1750842749177;
        Wed, 25 Jun 2025 02:12:29 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 00/10] Add clock drivers for SM7635
Date: Wed, 25 Jun 2025 11:12:18 +0200
Message-Id: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHK9W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3eJcczNjU93knPzk7GJdczNLyxRjY4uUZGNzJaCegqLUtMwKsHn
 RsbW1AGsxPtxfAAAA
X-Change-ID: 20250620-sm7635-clocks-7699d338dc37
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=2228;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=zDunNlLlGkt8vOOzGrRzlhaxzDGdivSnyWKJOtlz/jA=;
 b=SMLPVup1r/nUyPhYA8Ui5bbLfgLzvh8d2tNSLxcXFVudppa+x5L9rf7tWUdxw64KXfAwLG8VN
 KZ84inBkg1RCmx9ZRky6vprHGoWlwOh8eNw0Qi7xh3YU02c6at4stus
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
VIDEOCC on the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (10):
      dt-bindings: clock: qcom: document the SM7635 Global Clock Controller
      clk: qcom: Add Global Clock controller (GCC) driver for SM7635
      dt-bindings: clock: qcom: document the SM7635 Camera Clock Controller
      clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
      dt-bindings: clock: qcom: document the SM7635 Display Clock Controller
      clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
      dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
      clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
      dt-bindings: clock: qcom: document the SM7635 Video Clock Controller
      clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635

 .../bindings/clock/qcom,sm7635-camcc.yaml          |   51 +
 .../bindings/clock/qcom,sm7635-dispcc.yaml         |   63 +
 .../devicetree/bindings/clock/qcom,sm7635-gcc.yaml |   62 +
 .../bindings/clock/qcom,sm7635-videocc.yaml        |   53 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 drivers/clk/qcom/Kconfig                           |   47 +
 drivers/clk/qcom/Makefile                          |    5 +
 drivers/clk/qcom/camcc-sm7635.c                    | 2148 +++++++++++++
 drivers/clk/qcom/dispcc-sm7635.c                   |  962 ++++++
 drivers/clk/qcom/gcc-sm7635.c                      | 3227 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-sm7635.c                    |  563 ++++
 drivers/clk/qcom/videocc-sm7635.c                  |  412 +++
 include/dt-bindings/clock/qcom,sm7635-camcc.h      |  131 +
 include/dt-bindings/clock/qcom,sm7635-dispcc.h     |   61 +
 include/dt-bindings/clock/qcom,sm7635-gcc.h        |  210 ++
 include/dt-bindings/clock/qcom,sm7635-gpucc.h      |   56 +
 include/dt-bindings/clock/qcom,sm7635-videocc.h    |   36 +
 17 files changed, 8089 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-clocks-7699d338dc37

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


