Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF6E5AB22F
	for <lists+linux-clk@lfdr.de>; Fri,  2 Sep 2022 15:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237835AbiIBNwh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 2 Sep 2022 09:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238303AbiIBNwH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Sep 2022 09:52:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43D91114D8
        for <linux-clk@vger.kernel.org>; Fri,  2 Sep 2022 06:26:36 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id cu2so3978405ejb.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Sep 2022 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZF/uMwTcnfyz2qEE7xRsLAhPm27QsIK3fVdRMITh1go=;
        b=mtCXZWdp9QgmrYW++Cea2CEB1DgoyAJM1tlVGEe5YBBxfrhzbIOh++mMUvheALAnUJ
         qglEpw7YAZAqrT0t19/ZFVIhClLwiJuoc+Gc2atWP13qPCL2scgmjjlzWm+XD5L5t84b
         pDE519WHl1qfcZnXOQxXEsiQfqsGdayCi14KO0qLt1ZVPU7SLwI0KPFrWqryauaiJf19
         BxwZTV44yNf/DLXwCaIiwcaftVf4ADpFA8ky6TvhyLS5z7cT3imLS15KDFLk04iJvh8i
         hK8dmoA99XTyG2NO5reAVYM8gTNza6KFWvKuN3AKeOZjjUvJGrGduYP6puiDVkMG6CSe
         MzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZF/uMwTcnfyz2qEE7xRsLAhPm27QsIK3fVdRMITh1go=;
        b=wjc9C0nqGYW/VDwXZW8JczuV74Dz6j76VB015ELP/EvS/Z88NdpRykx1xfAJnY4SK5
         YhUWOr9+n386qE4I3La0Mg0v+tN+PqS7s46M9LKiP9Bd9FllwppKNm6CRvbzNwzQFPUp
         3nOEEBpwe9C0K8HDX3J2WsMSrGqt/PoW5IDItQGXjcAZqYiH/6uHoXrK6viNbFDEZ+io
         BQu/UcnyhvS35t3wSzUnYeoyUXfDYJ65n3iGvPMX94m0bsaHOPSqHwM7VUrBHbNh1CDV
         CQGBrJzUD2th0CF3C3JPbMVmyFMDUWhBqoSfaNqIkiwmIkugXaG60ySuecKF7iNZnJHV
         LfoQ==
X-Gm-Message-State: ACgBeo2si4+7ogqNR2N6Quo8xn1xFIKxNxJw4MLdqZJqeoyH7OXVRUPm
        bUbX3u2n/eq9m6QU79INh6A4JZB4L/6ESXsiQmuO/w==
X-Google-Smtp-Source: AA6agR6uVeydIrFZMSXhTDDYS4+Yng+f3hQTQnzA1QcrBi8I6dCnkKtn5QHHr9QNmRCaKQoIFPtEWdFKnqttE3hhFYA=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr21506072ejc.208.1662125177323; Fri, 02
 Sep 2022 06:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
 <CACRpkdb25ikL4F499NDCrv1kf2FGvJxqDW2wk9GNQCqrbX9kKQ@mail.gmail.com> <bb4804c0-04d2-6e0c-b9db-1243828ca515@gmail.com>
In-Reply-To: <bb4804c0-04d2-6e0c-b9db-1243828ca515@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Sep 2022 15:26:06 +0200
Message-ID: <CACRpkdZwkhvM7JGeisdAyh4Bg2hx5E+dSG89Psb=13hD+wkjoQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for i.MXRT1170-evk
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 2, 2022 at 2:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> On 9/2/22 04:06, Linus Walleij wrote:
> > On Thu, Sep 1, 2022 at 8:33 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> >
> >> This patch contains:
> >> - Update to imxrt_defconfig
> >> - Devicetree
> >> - Clock driver
> >> - Pinctrl driver
> >
> > No it does not, I already merged that.
> >
> > I think you should probably split up your series per-subsystem so the
> > clock bindings and changes can be merged separately etc.
> >
> > Then the DTS files can be added to the ARM SoC tree as a final step.
> >
> > When you send everything in one bundle like this subsystem maintainers
> > don't know if they can merge e.g. just the clock patches separately
> > and be done with their part (like what I did with pinctrl).
>
> Do you think its possible to add Docs for Device tree compatibles that
> aren't added yet?

Bindings and drivers are orthogonal, we only submit them together
to provide context for reviewers.

It is also possible to submit device trees with compatibles and entire
nodes without bindings because there essentially is no real police for
this. Of course it is not recommended.

If you are confident that bindings and device trees will come in the
same merge window it is fine to merge them separately through different
trees.

Yours,
Linus Walleij
