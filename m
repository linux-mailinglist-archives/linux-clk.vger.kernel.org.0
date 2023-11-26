Return-Path: <linux-clk+bounces-565-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 015597F950D
	for <lists+linux-clk@lfdr.de>; Sun, 26 Nov 2023 20:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A000A280D27
	for <lists+linux-clk@lfdr.de>; Sun, 26 Nov 2023 19:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D51F12E63;
	Sun, 26 Nov 2023 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214FAFB;
	Sun, 26 Nov 2023 11:30:14 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b842c1511fso2277006b6e.1;
        Sun, 26 Nov 2023 11:30:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701027013; x=1701631813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF5iPL+UoN0pmz/Mf8oI3xqxZwEF9KwzO7lwyRU7zig=;
        b=AESui101vHOr9aIZi/YcFTWW+gBIuiTPzrG2UKme1p2IT2yD+hf7OVWg8JNOc/9Kk/
         p5SouCtbykOjdPagzX73dt1q/zeZBS2wwyPfKYWPIYENT7HuhOyo8YS/vavJgaTjikbN
         z2Wl/WFItFxJcrQ3iKZNzH8uF9gKgvVCE7cH6vLMIu49Ujx9cu/altz66M1/Jx4FeaRD
         XoizgUYAU74odl0fblWOW6NdK2oltAPEkPHR2cSxEomScpjuFHxdE+cLKcO5vulRcJbb
         9OajcvCSD1tmq9GWgbqHv9adZ3kXZ2GF3B4ISzW8nMXdHZnaZHtq9rhBPDkSk1kACEYE
         ZDSQ==
X-Gm-Message-State: AOJu0YytdP763isLbdiTgtsRZQUm7L7XjsBovhRC5R6UdelJbkT2Zzxf
	HctPI5ebNaMmw4AqMT+G9g==
X-Google-Smtp-Source: AGHT+IFN9FkllIs8NwE5M+5eMxZJDjxYTM7WvxpxuS0JRkvWMdLvzypLXD2zs6vmagC6jGp16eXjRQ==
X-Received: by 2002:a05:6808:1250:b0:3b5:6533:d2cb with SMTP id o16-20020a056808125000b003b56533d2cbmr9895625oiv.46.1701027013354;
        Sun, 26 Nov 2023 11:30:13 -0800 (PST)
Received: from herring.priv ([2607:fb91:9e5:15e5:aee2:7746:1955:d879])
        by smtp.gmail.com with ESMTPSA id w13-20020a0568080d4d00b003b85bd22147sm642373oik.49.2023.11.26.11.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 11:30:12 -0800 (PST)
Received: (nullmailer pid 76358 invoked by uid 1000);
	Sun, 26 Nov 2023 19:30:05 -0000
Date: Sun, 26 Nov 2023 12:30:05 -0700
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, dri-devel@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>, Remi Pommarel <repk@triplefau.lt>, linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <170102700475.76284.1528867317482713371.robh@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>


On Fri, 24 Nov 2023 09:41:15 +0100, Neil Armstrong wrote:
> The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
> amlogic,meson-axg-hhi-sysctrl system control register zone which is an
> intermixed registers zone, thus it's very hard to define clear ranges for
> each SoC controlled features even if possible.
> 
> The amlogic,g12a-mipi-dphy-analog was wrongly documented as an independent
> register range, which is not the reality, thus fix the bindings by dropping
> the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.yaml
> and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.
> 
> Also drop the unnecessary example, the top level bindings example should
> be enough.
> 
> Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml          | 12 ------------
>  1 file changed, 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


