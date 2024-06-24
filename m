Return-Path: <linux-clk+bounces-8506-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D2914051
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 04:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1583283514
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 02:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D774C96;
	Mon, 24 Jun 2024 02:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="ASTeX4QF"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE084400
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 02:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719195347; cv=none; b=AkNLQZYjsOrGjzaOGrpofuA1+7u8KYIUXicSQ33iigw+nWrISTx1uyHRK2/wASZJ8iSucXWUUroDUfGe0BCcP8ZT7iA6weuSM1kLuYcYXT4zvDfPh0YHURXZ2sDtwBZJUal632Xb/lixro4ZDMkmdm/W8k/5d0KpsLRVX01sdNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719195347; c=relaxed/simple;
	bh=JijfjFPlraHiUgnawO2/kxVwba0m23O7FMLW3giYAVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oGCNx6qmHqx08E0tvGVMU+ffqHGbV0y3IKACE/SoVmel99s1w1q3GT2lGdsI+SYblb9chPGYJioHHPO0IDu3XjgBK3Gm4jY+zivg4nuVzld4c/Q5e8IqBbL817aFIo67T8vdVt1Hx5y+65mdA9oWqO/+En7ME7eNyVPGvMDV220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=ASTeX4QF; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ba33b08550so1768242eaf.2
        for <linux-clk@vger.kernel.org>; Sun, 23 Jun 2024 19:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719195344; x=1719800144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cG0rkekfA0/04oEi1+NIQK8l/D8qu4Ajnp33da6VKb8=;
        b=ASTeX4QF/rknmMZYK6L22SpZy7Ier2Q8dKkqZX8KnMJK8Qp3VRL2DCrBIXTsYL4zFk
         NTlodH6gJDHe41/qb//b4MKZOaIjMrd+dp8/GgVCw47N2YtT5KpUGSppizD41GzpT+5N
         +eMq5WeyRWzq19GiGSqiyH31Jf9oeB2iZRcGshEkO4dC+aK8jSi3y/SkH9Q94LlDzfUd
         aHIFkr2+N9dq611V5O9kQJTrUjAqYNkGQbmt6C6WDAGTESGqWfhGWfbJw9U436K2B3Yo
         g8CQanXX3Zmm0Wp9jA807SU2YUpfiWD8A10Lxu6iTjLk2gZ2CQlwRvEvl0SL7Sc0dw46
         w7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719195344; x=1719800144;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cG0rkekfA0/04oEi1+NIQK8l/D8qu4Ajnp33da6VKb8=;
        b=JSdZqcQXQPw2Iu+FXpMGHAB/1YNPr3qTrcfiKK39O0La1IiqmCnkoLswaINS0GXH2+
         n3p4WGjm4qUj1upP+wiQQDy+08qCAe2yB2TRuSrWCZw6e3dHpt4tDfGw7BlxsYW2Kauj
         MmNdeCxArnpVwu/BQLzEDSUP3J1+cFoEv8NW4/ezweHq5eGaBlXorKmgmwKZDdiMeB2d
         wPw6X9DmEKbCH/PaVJ16raSRa5w1ZfyTC1Hcy8Xod6n5GTdexN6DtBcH1X82UeehtfJz
         LwvGMvSB3kawHdabNezmBlpFKHKp+EchUBpj2cO87zwPeSZt8jVCK1mIlC1th9egXCvt
         Pnnw==
X-Forwarded-Encrypted: i=1; AJvYcCUAj7HjI8mFerar9ocuTB4GcHiaeC93nhqtvbnUpJgKAa+D/5HrlfrgEAwsnLgCyS01lKvTp8t7GBQa/HAO18L4d1XdSjOCzX6l
X-Gm-Message-State: AOJu0Yzkt8ojats3LO36GYZgM3fLTy+7dcsDRgTWQ76n9tS4EQNn4MOi
	radE09/hqz9xy26bjqldqSb0rAQMEf4Yrg7nHAZ6WP/hL8p+9tFuzmgsiBTwdclf6FkQHIjxiua
	+
X-Google-Smtp-Source: AGHT+IG4tN22FOX8kFP/2mE6a1+JdImZuY7NBg6dlaS2QQXJKWOjfrDeHKXCWj/E2BBFso0FuA0m2g==
X-Received: by 2002:a05:6870:2183:b0:258:37e7:a1d0 with SMTP id 586e51a60fabf-25d06c7d88cmr3516225fac.30.1719195344471;
        Sun, 23 Jun 2024 19:15:44 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1584:936e:5eb0:fab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706511b137csm5071770b3a.86.2024.06.23.19.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 19:15:44 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v2 0/7] clk: thead: Add support for TH1520 AP_SUBSYS clock
 controller
Date: Sun, 23 Jun 2024 19:12:30 -0700
Message-Id: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7WeGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMj3ZIMQ1MjA93knGzdVAtD40RL8yTLVEMzJaCGgqLUtMwKsGHRsbW
 1ADdeJAVcAAAA
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
 Drew Fustini <dfustini@tenstorrent.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719195343; l=5635;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=JijfjFPlraHiUgnawO2/kxVwba0m23O7FMLW3giYAVE=;
 b=F7q7iNFfGLlmb776JDHJ7tm1chn5J68zQ7WbJCM4oKJk4x9bLeDQswpYtOZs8I+SqZwcLw+e1
 iBLTwDyn374BQLTAn520AvakNQv6cVPk72xCQx7iJKbq9+sTeALDIk5
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

This series adds support for the AP sub-system clock controller in the
T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
2023 [2]. Jisheng made additional improvements and then passed on the
work in progress to me.

Changes in v2:
 - Add clock property to the gpio nodes after Conor asked why they were
   missing. These clock gates correspond to enable bits in PERI_CLK_CFG.
 - Drop 2 cell address and size properties from the binding example per
   Conor and add Reviewed-by from from Conor.

Changes in v1:
 - Split th1520_clks into groups for gate, mux, div, pll
 - Convert gate clocks to devm_clk_hw_register_gate_parent_data()
 - Convert mux clocks to devm_clk_hw_register_mux_parent_data_table()
 - Split the PLL recalculation into th1520_pll_vco_recalc_rate() and
   th1520_pll_postdiv_recalc_rate(). Based on Emil's comments in v1,
   add logic to handle the fractional portion of feedback divide value
   when the delta-sigma modulator (DSM) is active.
 - Drop clock-names from the binding per Stephan to avoid relying on
   anything other than the cell index when describing clk_parent_data
   (note: I dropped Rob's Rb because I changed the binding patch)
 - Rename reg/reg2 to cfg0/cfg1 to match the SoC documentation
 - Rename struct for pll clocks from ccu_mdiv to ccu_pll
 - Rebase on v6.10-rc3, remove the dts node reordering patch from v3
   now that it is in mainline

Changes in RFC v3 [3]:
 - Drop redundant new line and unused clk label from the dts example in
   the DT binding which I failed to fix in v2.
 - Add patch [4] from Thomas Bonnefille that fixes dts node ordering in
   th1520.dtsi. Conor has already merged it into riscv-dt-for-next so
   the dts patches in this series are based on top of that.
 - Remove fixed uart clock and converted uart DT nodes to use clocks
   from the clock controller.
 - Remove fixed apb clock and converted the dma controller and timer DT
   nodes to use a clock from the clock controller.
 - Made ccu_disable_helper() and ccu_enable_helper() to static functions
 - Follow the advice from Stephen Boyd in Yangtao's original series to
   not use strings for clk tree topology. Created clk_parent_data arrays
   to be used with CLK_HW_INIT_PARENTS_DATA instead of parent strings.
 - Rebase on top of v6.9-rc7

Changes in RFC v2 [5]:
 - squash the header file patch into the DT schema patch
 - describe the changes I made to original series in the cover letter
   instead of the individual patches
 - fix my typo in my email address

Changes in RFC v1 [6] from the original series:
 - corrected the npu_clk enable bit
 - deduplicated CLK_NPU and CLK_NPU_AXI number in header
 - fixed c910_i0_clk reg typo
 - fixed checkpatch and dt_binding_check warnings
 - rebased on v6.9-rc5
 - revised commit descriptions

Thank you,
Drew

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[2] https://lore.kernel.org/all/20230515054402.27633-1-frank.li@vivo.com/
[3] https://lore.kernel.org/all/20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com/
[4] https://lore.kernel.org/all/20240425082138.374445-1-thomas.bonnefille@bootlin.com/
[5] https://lore.kernel.org/all/20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com/
[6] https://lore.kernel.org/all/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/

To: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
To: Fu Wei <wefu@redhat.com>
To: Yangtao Li <frank.li@vivo.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (7):
      dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller
      clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks
      riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      riscv: dts: thead: change TH1520 uart nodes to use clock controller
      riscv: dts: thead: change TH1520 mmc nodes to use clock controller
      riscv: dts: thead: update TH1520 dma and timer nodes to use clock controller
      riscv: dts: thead: add clock to TH1520 gpio nodes

 .../bindings/clock/thead,th1520-clk-ap.yaml        |   53 +
 MAINTAINERS                                        |    3 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |   12 -
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |   12 -
 arch/riscv/boot/dts/thead/th1520.dtsi              |   73 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/thead/Kconfig                          |   12 +
 drivers/clk/thead/Makefile                         |    2 +
 drivers/clk/thead/clk-th1520-ap.c                  | 1086 ++++++++++++++++++++
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |   96 ++
 11 files changed, 1290 insertions(+), 61 deletions(-)
---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240622-th1520-clk-e813a97b9e16

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


