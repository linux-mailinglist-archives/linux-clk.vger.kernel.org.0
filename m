Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8415525F29
	for <lists+linux-clk@lfdr.de>; Fri, 13 May 2022 12:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379077AbiEMJbl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 13 May 2022 05:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbiEMJbk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 May 2022 05:31:40 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D36B30568
        for <linux-clk@vger.kernel.org>; Fri, 13 May 2022 02:31:39 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id n10so6269741qvi.5
        for <linux-clk@vger.kernel.org>; Fri, 13 May 2022 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w4MIFUv90x0E+F2j8zQZL3qxhXK4eI32Zwmran4JGDc=;
        b=hTS6dCEpWrDPK0UejiOo004dwpgaYnO8y4o0KLQL+Fid79/PUnzCUpFY1R13iBK3kr
         zedTGedtEPeRY5LatdeofOQ/85qxMkI1ZZkdycgNt600JFtJDDZ7ciZOLWPOxFCVSE8A
         oaSON8Y1KdYh5zBJjc834UMjl5RY8lmM8EYrPQVxWn4ZavuAwOc/Sul3sbOZ7Hbyw1K8
         MfXtHdu7maRUFzzksnMt2zpq5QL3IlqtmRgv13jdKbqPlyVs2VBpcw5ip9wtBdnKPj2L
         O+ciK3uhmuxtltFQ88OXILz7jYugbfkAba/E1dIjQTaIpFCotO6nlAJEwamVlsrWI1vW
         gOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w4MIFUv90x0E+F2j8zQZL3qxhXK4eI32Zwmran4JGDc=;
        b=sZIvZE5IbQ8+Q38S7Nz2U5K8bgCjCdvZevGM67fouavwg9eOjD6ffdQA37eSAjTIqb
         0tazj2I1Nw3ZnMbQyuJxu48SJMfDrTjCYgIf5QAaaJmGM9vlfcujC7nhz6yIaN49BgQF
         cVfiWmxa42HmohExYPsVXo3E3+IiN17Zm0Rx+Um3+vsw2HzkzqcrH/CR0Luzj0UKsENi
         YN21qAZogQOWt7e9OoCrAWVWHMerW1XujUOXe+jv33I1BUiWygAwYSgS5LSnyurFse4Q
         bQb5u6TvcWa7M1fWk1UMIRt6q81EUo0qiw3lkSdmb6Ywb5fbypjNwwUwvFUGI8W7A3Te
         Nlvg==
X-Gm-Message-State: AOAM53042AeafFWdgnMhVpkeCNobk69ZiPf8gzCgXTKQ1x7i3nGXWUAg
        /YkiAPnBwUAkMSx1+/Gx9E8x6dJyJqqRvWRnCqGWwg==
X-Google-Smtp-Source: ABdhPJwGPoK9BT0rxRhr4uuoUx1JaRL+s3QX95bUfyvLWSUYgvYzME3GmtTzAgVf5neSQm0HZEOUWxe+vCkf/EbYtBs=
X-Received: by 2002:ad4:5f4e:0:b0:45a:b97d:14de with SMTP id
 p14-20020ad45f4e000000b0045ab97d14demr3392283qvg.73.1652434298391; Fri, 13
 May 2022 02:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220512172909.2436302-1-dmitry.baryshkov@linaro.org> <Yn4LsB/dkwjdslQs@hovoldconsulting.com>
In-Reply-To: <Yn4LsB/dkwjdslQs@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 May 2022 12:31:27 +0300
Message-ID: <CAA8EJpqCFAxNuK4B25hZUQa4DWqc3M4FXvJq7Cob752OWUmYcg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] PCI: qcom: Rework pipe_clk/pipe_clk_src handling
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 13 May 2022 at 10:41, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, May 12, 2022 at 08:29:04PM +0300, Dmitry Baryshkov wrote:
> > PCIe pipe clk (and some other clocks) must be parked to the "safe"
> > source (bi_tcxo) when corresponding GDSC is turned off and on again.
> > Currently this is handcoded in the PCIe driver by reparenting the
> > gcc_pipe_N_clk_src clock.
> >
> > Instead of doing it manually, follow the approach used by
> > clk_rcg2_shared_ops and implement this parking in the enable() and
> > disable() clock operations for respective pipe clocks.
> >
> > PCIe part depends on [1].
>
> This one was merged a month ago.

It is not in Linus's tree (only in Lorenzo's one). So anybody wishing
to test the series would still have to pick it up manually.

>
> > Changes since v4:
> >  - Renamed the clock to clk-regmap-pipe-src,
> >  - Added mention of PCIe2 PHY to the commit message,
> >  - Expanded commit messages to mention additional pipe clock details.
> >
> > Changes since v3:
> >  - Replaced the clock multiplexer implementation with branch-like clock.
> >
> > Changes since v2:
> >  - Added is_enabled() callback
> >  - Added default parent to the pipe clock configuration
> >
> > Changes since v1:
> >  - Rebased on top of [1].
> >  - Removed erroneous Fixes tag from the patch 4.
> >
> > Changes since RFC:
> >  - Rework clk-regmap-mux fields. Specify safe parent as P_* value rather
> >    than specifying the register value directly
> >  - Expand commit message to the first patch to specially mention that
> >    it is required only on newer generations of Qualcomm chipsets.
> >
> > [1]: https://lore.kernel.org/all/20220401133351.10113-1-johan+linaro@kernel.org/
>
> Johan



-- 
With best wishes
Dmitry
