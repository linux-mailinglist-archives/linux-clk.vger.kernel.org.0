Return-Path: <linux-clk+bounces-892-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E073804F9E
	for <lists+linux-clk@lfdr.de>; Tue,  5 Dec 2023 10:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6DF281769
	for <lists+linux-clk@lfdr.de>; Tue,  5 Dec 2023 09:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032334B5DB;
	Tue,  5 Dec 2023 09:59:45 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258A79E;
	Tue,  5 Dec 2023 01:59:40 -0800 (PST)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rASD8-0006dW-Kj; Tue, 05 Dec 2023 10:59:26 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chris Morgan <macroalpha82@gmail.com>,
	linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	sam@ravnborg.org,
	robh+dt@kernel.org,
	javierm@redhat.com,
	quic_jesszhan@quicinc.com,
	krzysztof.kozlowski+dt@linaro.org,
	daniel@ffwll.ch,
	devicetree@vger.kernel.org,
	mripard@kernel.org,
	sboyd@kernel.org,
	maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	Chris Morgan <macromorgan@hotmail.com>,
	tzimmermann@suse.de,
	neil.armstrong@linaro.org,
	linux-clk@vger.kernel.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	airlied@gmail.com
Subject: Re: (subset) [PATCH V2 00/10] rockchip: Add Powkiddy X55
Date: Tue,  5 Dec 2023 10:59:24 +0100
Message-Id: <170177035808.530583.4519890630832587143.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 4 Dec 2023 12:57:09 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Rockchip RK3566 based Powkiddy X55 handheld gaming
> console.
> 
> Changes since V1:
>  - Corrected a bug with the DRM mode flags for the video driver.
>  - Adjusted panel front and back porch and pixel clock to fix
>    issues with display that occurred after correcting DRM mode
>    flag bug.
>  - Add a new clk frequency for PLL_VPLL to get panel to run at ~60hz.
> 
> [...]

Applied, thanks!

[09/10] dt-bindings: arm: rockchip: Add Powkiddy X55
        commit: b7d755653790b5f5497df8bfb146c38beeb33b74
[10/10] arm64: dts: rockchip: Add Powkiddy X55
        commit: 009e2d0c224913eb4f44e9c2efe7a15789fc0c18

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

