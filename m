Return-Path: <linux-clk+bounces-8095-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D697909B26
	for <lists+linux-clk@lfdr.de>; Sun, 16 Jun 2024 03:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C52AB21925
	for <lists+linux-clk@lfdr.de>; Sun, 16 Jun 2024 01:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3381667C1;
	Sun, 16 Jun 2024 01:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="SkdxgZBI"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B28163A97
	for <linux-clk@vger.kernel.org>; Sun, 16 Jun 2024 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718502925; cv=none; b=V1wcLykjSmdyWje1JFiOkqIZMqZIpHyvHT7NExmHImGv7mQK5A5/qHOFjicw6+r+Aa3FdvNYR8tw0F5H1pmzuF8of4d9hJoExK87SvcIYE2PLLvtRucllUftpWIM9B1QbJwfHvBzaOTZwoZ1zFaBbx42rEBqNJqD5Wh1azRq9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718502925; c=relaxed/simple;
	bh=jdmR4mbethnmbINzfYelG5bZ/4P0Pr0DSPkP3jxTYBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWwrYEj2a4mKgciA36ZvUbARSoGVfMJcinjm8CN6Agm2yAtNEGq2hFJrtyvIWG7XAOickUpZwCTuv0EgVderwZPl2t92X3fI+ewYRxGysTWapkIyngA1QQOqID47bjxK/mqsmoMo0kP+wyQX8zD9IxLaduptqld3MFtp0SNd258=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=SkdxgZBI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-705f0c54846so662488b3a.3
        for <linux-clk@vger.kernel.org>; Sat, 15 Jun 2024 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718502923; x=1719107723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNPhbe4CKhTW6lWgdp189/o19T4GZdsybtYcMCrAtjY=;
        b=SkdxgZBI32XHDadUvsgtL5kEtN0sVi8/KDCk1hyGOK+opUkDOljg/fKCWGTNO5qxwH
         qvj253Y/gaZ/bie9jA68YXQb6gKxdZDqmaZs7YwNmHGmNBm2PCGAZLwta5f36gD2VoN0
         ht3bYxAsar1c/+JtzB2erVY46eWeSMpuVzTBGXlaMrzAcpTd+yNDE+EtP/tSCMGLyxYL
         M45WLo+0DPqiXMCvXBrTYr/Od2BrM4VM2093cLYgOk6pm+9gwBnoQFRl+m4Qd4PfnUKc
         XBUoM8MaP8kK8CqZ797UmZmfoO+AaQs+S2PvLtJQEJt+PhmpM2ZAIj5AP1SF7Jd4oRsg
         tLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718502923; x=1719107723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNPhbe4CKhTW6lWgdp189/o19T4GZdsybtYcMCrAtjY=;
        b=KzY5UPEkU5kJcYcRgzY+OP6rfF04Ft6MecYgV4NkVwgEdgiejF11yNLyE+74+7P5g2
         dDR52chl8tMYaO/H/Zq+LgNgL9Qf/1h5gfUNaVoOiM6zFWn0cij9TCBYqSAYzQUNChzF
         20pJQMTHGhaVksIWB8xIKCGa+TVje/XVU8D+tdV0ADu2gbXqRyB3u1JKUrXYSw+5RkzW
         EWZ00hyiy9BtnqiIaWty78F88ZX+HR+JtqAHHguFAeqzQhCILjvXKFYITH8FQzUzaw2n
         V0jKGr8hCE/NzL1DU6Vk27ENl76KwZHIRlG8BxnNnunDXKoMlEarot39HV+NF3WX2/Ar
         VEFg==
X-Forwarded-Encrypted: i=1; AJvYcCU5dV+USlvTYecr2ONMUon4KIymlHX2PxFfg4ObzZhfQVUH93j5U3rU4Qb7qZF6P6cYXK5Jp6AouPu2xSUga0aS1cAMRbQY9d/E
X-Gm-Message-State: AOJu0YxylZb+BrIbsUqwBhx7dwLsI1UvFEUiBgceQX5kZbLKgIjDYoRF
	70byikvBxhyI3EGYveifXm6yVutTXV07gFvmqkcoh5TeX+KjsvMZk4FMxPSUCqs=
X-Google-Smtp-Source: AGHT+IG2W5IPRHAG1kGoyujjDgtV/z+pDbrlN9J1y1wQMn05h74BhHu6aBbrwBiwAJOG2I5i3s17mA==
X-Received: by 2002:a05:6a20:d80d:b0:1b8:3f6d:3037 with SMTP id adf61e73a8af0-1bae7ea0f63mr7711032637.18.1718502923295;
        Sat, 15 Jun 2024 18:55:23 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1cea:28dd:2ee0:e8e5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a769aedbsm8751201a91.43.2024.06.15.18.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 18:55:22 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 15 Jun 2024 18:54:32 -0700
Subject: [PATCH 3/6] riscv: dts: thead: Add TH1520 AP_SUBSYS clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240615-th1520-clk-v1-3-3ba4978c4d6b@tenstorrent.com>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
In-Reply-To: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.12.3

Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..10a38ed55658 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/thead,th1520-clk-ap.h>
 
 / {
 	compatible = "thead,th1520";
@@ -161,6 +162,13 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		clk: clock-controller@ffef010000 {
+			compatible = "thead,th1520-clk-ap";
+			reg = <0xff 0xef010000 0x0 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		plic: interrupt-controller@ffd8000000 {
 			compatible = "thead,th1520-plic", "thead,c900-plic";
 			reg = <0xff 0xd8000000 0x0 0x01000000>;

-- 
2.40.1


