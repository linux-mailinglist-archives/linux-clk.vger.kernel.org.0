Return-Path: <linux-clk+bounces-1292-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A080F76A
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 21:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D82861C20B9E
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 20:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747DA5276A;
	Tue, 12 Dec 2023 20:03:33 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4F9A6;
	Tue, 12 Dec 2023 12:03:27 -0800 (PST)
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rD8yJ-00069W-Cc; Tue, 12 Dec 2023 21:03:15 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alex Bee <knaerzche@gmail.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH 00/31] Fix and improve Rockchip RK3128 support
Date: Tue, 12 Dec 2023 21:03:14 +0100
Message-ID: <2167016.irdbgypaU6@phil>
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

Am Dienstag, 29. August 2023, 19:16:16 CET schrieb Alex Bee:
> this series fixes some issues I found when testing my "new" RK3128 board
> with the mainline kernel and adds some core functionality like SMP bringup,
> usb and networking.

before I discard this thread, is everything from here migrated to
separate serieses or are there patches in this big pile that are still
relevant on their own, that haven't been applied?
[I lost track of what did go where ;-) ]


Thanks
Heiko



