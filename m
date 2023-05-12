Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825A27008A7
	for <lists+linux-clk@lfdr.de>; Fri, 12 May 2023 15:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241093AbjELNL7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 12 May 2023 09:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241037AbjELNL5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 09:11:57 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7168F10E47
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 06:11:54 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3062b101ae1so6502195f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683897113; x=1686489113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dSzolrdrjqrvV5jM7DxDkMJJ1EaIhjBa4LLAjT5M2Zg=;
        b=qEQK5bCkzatFMyVJMwHgx2rK0us/XZR8B5vnl/7ZgYsFOJvGnXZuFI4A292tUjwKud
         C9YNBtVnUyQf1FyTS9a572hFg83cBQad0alfAViz7A5DbKP8b5w8Br11exNaopjFxZZZ
         OBIqrzkij4q0XNt10xWXHbiYJx9r083mltzFzKKSkYWdzx9jvAu0/Ea7TTV1IDPlfJXH
         HjyxN+cFrYWad5HReKdxiS51GVoP4HssnLprYU3fQh90o2Tj3n5O2vfduVKDzm8V6ciB
         wNQcd0OjFeYMmKKp37zXZ6PgqYxiXWxzN80gATPCiCy0I38aifgd604HljvekWKMofuB
         hNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683897113; x=1686489113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSzolrdrjqrvV5jM7DxDkMJJ1EaIhjBa4LLAjT5M2Zg=;
        b=M27kP+G6c585qkpJwvEgSGoGCftJ0KBT2PaoAt/qWvm5yDwOnqy9/0TIl2p3duEr27
         UX87E92KwJ8ykEvS6OaaS2xKSUPNnCGldJLEJN0XD7ss9ulh5/pdv3X1QRuzOkS3yQ7J
         b5XDeSw4jEIP3AoggoICda/5TjgC9HbdHzybL+9aDgYl0t2DTdt445SmMN9jPFi1MqNE
         +6iyFC6idUK7ZGYMp7omXtXE8VHrbuKV0T3ntpAKgiVfBa5wu3ISFeXXGdGbC0XWdUPk
         V1Ohd0Ka2sg3afHQ8mCRPF2kLgbqx1MD6Vp8QNF+Nfx28EV4pGsTlnjzY8V1YE4JA2sW
         XNCQ==
X-Gm-Message-State: AC+VfDzpnPOzk6fPKfQZJ4CvHQh39KYCYpcBMjlq9bt5HGpzfSOr6lit
        VArWCh8+MaNt7tdDjdPVxm4KHg==
X-Google-Smtp-Source: ACHHUZ4gw2bdndhw4gApaKDMdbVIt1/UTMtQkNvjJrbkDUcVYz6SVipTx5yffEGpenyHMwVUC2LT2w==
X-Received: by 2002:adf:cc84:0:b0:306:330a:da67 with SMTP id p4-20020adfcc84000000b00306330ada67mr17778239wrj.33.1683897112812;
        Fri, 12 May 2023 06:11:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:11:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 00/13] drm/meson: add support for MIPI DSI Display
Date:   Fri, 12 May 2023 15:11:31 +0200
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAM7XmQC/x2NQQrDIBAAvxI8dyEa05Z+pfSwmjVZUBPcRAohf
 6/0OHOYOZVQYRL16k5VqLLwmhvYW6f8gnkm4KmxMr0Z+lEbwBTXmT3UO1g4NtkLYYJJGLwPUDk
 N4J40Gv0gHSyqFnIoBK5g9ktL5SPGJrdCgb//8/tzXT92GohPiQAAAA==
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6399;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1ioRlM6STKtbr5n8sJFy2IU2vIqjn+wPqItJP37h25k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsR0YhUdBZ6BP+IJ1vjtxDIXTLtPmNaCk+jKxSe
 QOREreiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47EQAKCRB33NvayMhJ0YOqD/
 4jiZteuiK6HNWUFTp+TLyHkQa+SPFBtVBUJvsI64e18QsZ9Zz6pr/yNEV5CbsbhggK4cp36pP6kZ9y
 8TnMA15SXZszJd9NGGh+7+OHZ0nzmHRABNFpKHvF4Ka+csstygiEh++JEq4Dw+ZunZ8zuIhWVOuFPQ
 N9w2juugO4AiQTYa0gm/X6xm9gomSTDwv3kSKyQCahtlWBbW2Kro6F7FDXXMGbgKuLbJYQN0QWvZ5/
 a4vPTBhUoEeLUoD8adyvYimbAGj+paZHQ9JgT2DQcVuJrNhhRB2LUSZ1nPsoXNEAFjN2bgeYz4RYEL
 Wj235YkUI0tW3kePQ+G+OhQ2FK30P0VEHsVY7fxFZ6EA0BtKBd/+ip7Avam65vdASaRCSKcUVzFpiH
 pvOKwN8Ui/dYxRjcZaKJeBOqyE8+ACZA/HfR4oo1DkVWcWEyzbvLnndNiI+cCdlRMjujMBc28+JFIM
 9k1Eh8/r9IE3TMdNzhg+D9OyK0AFtfQ9K434SO788kDEDppPRaA2JnbljkQL3H3DtT1ZgxG/pyiZF8
 kMGpXeKzTg7ium68WI9h1F3Ihp34w7UqxPixKA8SX6773LBPp+UpuopDLxSuKHjBSdwUXrlV9ciZ9n
 rAHzrdS1if9cO+7MBFaLB//WDNjN6IyKKh8AJvgrmOhUlPUkTG175SVZqB8A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This adds support for the glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

This patchset is based on an earlier attempt at [1] for the AXG SoCs, but:
- previous glue code was a single monolitic code mixing encoders & bridges, this version
  is aligned on the previous cleanup done on HDMI & CVBS bridges architecture at [2]
- since the only output of AXG is DSI, AXG VPU support is post-poned until we implement
  single-clock DSI support specific case on top of this.

This is a re-spin of v3 at [5], the main change is about clock control, the clock
setup has been redesigned to use CCF, a common PLL (GP0) and the VCLK2 clock
path for DSI in preparation of full CCF support and possibly dual display with HDMI.

I kept review tags when the content was only slighly changed.

To: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-phy@lists.infradead.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Changes from v3 at [5]:
- switched all clk setup via CCF
- using single PLL for DSI controller & ENCL encoder
- added ENCL clocks to CCF
- make the VCLK2 clocks configuration by CCF
- fixed probe/bind of DSI controller to work with panels & bridges
- added bit_clk to controller to it can setup the BIT clock aswell
- added fix for components unbind
- added fix for analog phy setup value
- added TS050 timings fix
- dropped previous clk control patch

Changes from v2 at [4]:
- Fixed patch 3
- Added reviews from Jagan
- Rebased on v5.19-rc1

Changes from v1 at [3]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20211020123947.2585572-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/r/20220120083357.1541262-1-narmstrong@baylibre.com
[5] https://lore.kernel.org/r/20220617072723.1742668-1-narmstrong@baylibre.com

---
Neil Armstrong (13):
      dt-bindings: clk: g12a-clkc: export VCLK2_SEL and add CTS_ENCL clock ids
      clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
      dt-bindings: display: meson-vpu: add third DPI output port
      drm/meson: fix unbind path if HDMI fails to bind
      drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
      drm/meson: add DSI encoder
      drm/meson: add support for MIPI-DSI transceiver
      phy: amlogic: phy-meson-g12a-mipi-dphy-analog: fix CNTL2_DIF_TX_CTL0 value
      drm/panel: khadas-ts050: update timings to achieve 60Hz refresh rate
      arm64: meson: g12-common: add the MIPI DSI nodes
      DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel

 .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 117 +++++++
 .../bindings/display/amlogic,meson-vpu.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  76 +++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
 drivers/clk/meson/g12a.c                           | 169 +++++++++-
 drivers/clk/meson/g12a.h                           |   3 +-
 drivers/gpu/drm/meson/Kconfig                      |   7 +
 drivers/gpu/drm/meson/Makefile                     |   3 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  32 +-
 drivers/gpu/drm/meson/meson_drv.h                  |   1 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          | 364 +++++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h          | 160 +++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c          | 174 ++++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h          |  13 +
 drivers/gpu/drm/meson/meson_registers.h            |  25 ++
 drivers/gpu/drm/meson/meson_venc.c                 | 211 +++++++++++-
 drivers/gpu/drm/meson/meson_venc.h                 |   6 +
 drivers/gpu/drm/meson/meson_vpp.h                  |   2 +
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |  16 +-
 .../phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c  |   2 +-
 include/dt-bindings/clock/g12a-clkc.h              |   3 +
 23 files changed, 1428 insertions(+), 35 deletions(-)
---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

