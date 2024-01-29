Return-Path: <linux-clk+bounces-3059-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBB8410F4
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 18:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE8CB285B5A
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 17:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7133F9FE;
	Mon, 29 Jan 2024 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bikLOhZ0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70476C8D
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550126; cv=none; b=BDyCD6jtws+/ByR2hWOsPD7Q5NvfYGMCSKBHWx61ZkM+ZA8TzHgEh6IPb30/slqzhX7mN50ihTqFF+7L7AA1KEwrC4VD0yCep76B7FEVqyAgSNPI0m4AHsX79VWdqatpKUcCu3dBsZTC/wOd8I7B/qOaaSW956JavDQDe/3kdCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550126; c=relaxed/simple;
	bh=5SkzBWqg5XsN99LRODxpScj73dZpSEexX9iVzejqvag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Me93l9qX7lkly4hLNrU3JFifN1JjsoaXHhWiKW1p2jVdiC5WhnYr8QlnUg6DrzWpcWVpOm9jO7kT+rBDd21UGeZpZvO5h0GmVZUkUqdvRcBXnJ8D/MIvOs928USApZLbP/pNZ4oFlrAcOkDMLlAIY5AKnhDleL07C+8aEVhuYDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bikLOhZ0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a35c0ed672cso153358166b.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550122; x=1707154922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dW6z0PXAWbDu11OK6iP//ej1RhU41xLpgjvot5fMaQE=;
        b=bikLOhZ01zSeP51qdQOPHVVz1WdNMzbut3/9X6yD6eVgZDZlJOa7HsCDNuv48bEQAh
         aCatSW6S8p4sr2/+jdY5d0cbttKvdl+L+at2prcRuHkERTyOMcOQ39OyX26+SB1idqBa
         N92mGJNqPgqmDHuW8l+juIweVxtXkSLIIsEh2lSqzjxvM1vWHMRTEYNCAs+nfHjAK6Sr
         Hx/F52zY9XUxn/raMVnsGQr2Ck+YLPsnBDyVGd+ztAF9U8aFIUdnRaKm4sRsDnXFp7Li
         t8is8FFqhKsbaU1cR8+guDSaluqis0WPyVZ7Tc5Ez2wP7UEVUKQjvYz9Wm04u1xStfYu
         MNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550122; x=1707154922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dW6z0PXAWbDu11OK6iP//ej1RhU41xLpgjvot5fMaQE=;
        b=ZM9bsqp6PP1Sf5flO6dtYYdYrhw6vrWlhlfu+LHqN5ltLZ9yetW+1lW4ugu6QFiKiu
         3Vgs1gpU78Et0f/YpJWi+RRnpXiM8G5/iiidlE15GsdhskS06gIW3TzP/dF+/UANFITR
         YETY8rj9IO+g9/5Ko/mdRU26zlm9mTRoIoqHxUzJwcduMO5C0BPelroeTbWN+LAZV36y
         31zGQodb34Epl3eOoLBQY4onG9X31taXrqg0U5Wp/OWpjLyUb1xDzgVghbb5bCdTyvCs
         +iczng0BpsmoyD0ppwbWGqq2CVVbSn31jFYJvKAjotosCtthOMs2WoI5AMyodVlO1QKt
         +47Q==
X-Gm-Message-State: AOJu0YwGX6M3Ga1p8+MLD/vjdw2IFpm/2bnyIBYELqmPp8fihjASsbMU
	spXqTTMOztMbw0P/M/nxx+b5CAmqLbTbC/JJkQCBY0IdFXiJN15n3UsairI7yIo=
X-Google-Smtp-Source: AGHT+IGQ8e2FWNHxELPwatwUT3bo8Bx6VSPbCMJYPKKibK6j01f58ONbLlB7UTfvvWYS8Z7nfN96mw==
X-Received: by 2002:a17:906:4951:b0:a35:361f:f961 with SMTP id f17-20020a170906495100b00a35361ff961mr4292389ejt.54.1706550122068;
        Mon, 29 Jan 2024 09:42:02 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170906fcd900b00a311a360433sm4237765ejb.143.2024.01.29.09.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:42:01 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	inux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 5/7] arm64: dts: exynos: gs101: enable cmu-peric1 clock controller
Date: Mon, 29 Jan 2024 17:40:08 +0000
Message-ID: <20240129174151.1174248-6-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129174151.1174248-1-andre.draszik@linaro.org>
References: <20240129174151.1174248-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the cmu-peric1 clock controller. It feeds additional USI, I3C
and PWM interfaces / busses.

Note that &sysreg_peric1 needs a clock to be able to access its
registers and now that Linux knows about this clock, we need to add it
in this commit as well so as to keep &sysreg_peric1 working, so that
the clock can be enabled as and when needed.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

---
v2:
* merge patch #8 from original series version 1 into this patch, i.e.
add the clock to &sysreg_peric1 in this commit & update commit message
* collect Reviewed-by: tags
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index aaac04df5e65..e1bcf490309a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -429,9 +429,20 @@ serial_0: serial@10a00000 {
 			};
 		};
 
+		cmu_peric1: clock-controller@10c00000 {
+			compatible = "google,gs101-cmu-peric1";
+			reg = <0x10c00000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		sysreg_peric1: syscon@10c20000 {
 			compatible = "google,gs101-peric1-sysreg", "syscon";
 			reg = <0x10c20000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK>;
 		};
 
 		pinctrl_peric1: pinctrl@10c40000 {
-- 
2.43.0.429.g432eaa2c6b-goog


