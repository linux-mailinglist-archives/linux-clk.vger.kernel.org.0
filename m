Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A144E9FD7
	for <lists+linux-clk@lfdr.de>; Mon, 28 Mar 2022 21:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245747AbiC1Tia (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Mar 2022 15:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245348AbiC1TiW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Mar 2022 15:38:22 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92F04E391
        for <linux-clk@vger.kernel.org>; Mon, 28 Mar 2022 12:36:38 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id yy13so30825742ejb.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Mar 2022 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PR/o9qHd2rPzPd1PEol5Ylk7iHhm+A4/IpUGzULilKc=;
        b=sGKfsF/bMaS7gBEldBUizJ3UGr2/8Zn8FndLj8K0c8rRmHXS3Zq2cMFLgqB/MIsFiM
         E8uJQfcbLgDYM6bLDhXaRGLTZ50UpcCDShcIvMGZktpKjnpSvh7scpmNB/LduITXoYMc
         6To8PxiNcsEl5Sx186A+7yMjlTaQlce24UjJtOp70IToU06YzY33d6Rr3vO05oPPXUEn
         6DPatmbDjOJCIQiKCR8g2Mq2E1VgFBBnDI/PhiZBsrin+RBHwLgFjL4Iv6mD9bJ/0N9t
         v/AV4VPZl32e6jRxNuwQsiy4CxyGlGNjo/r7p/4y+1HxQ+/AM8as99oXuOBioHt1QBX7
         dsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PR/o9qHd2rPzPd1PEol5Ylk7iHhm+A4/IpUGzULilKc=;
        b=e85mv8eiQKGB9VB/EyCU2rt77MxCdTOPYN/5aIfguMLVAaywqaPrr//wOGjhzAlV9c
         27606ZZQVGc9aGC0Cr4VPoUIt2Fn6mQoukyoermDmN6TT/qXRDkBsDGLUgyHfxAu/XCm
         BDr/RZmV022sBmhHo4foCmOVZSkQjiFMY99MwmQ4tnyObFDxnE+k9e7EtBM7kbafxjyP
         eZfIspA4j1qRNv80CU3DJ2rf0sb054HhNZYdW1dVjtW8XVTTgumGshA/d3B/Q9kLLYbx
         I6elC4BYLSAJk7rAfxa8QDDlEXYYTkBsH43n8t1aj/fBYxCgfVMarDutNZ3q2l1MYNCU
         k2mA==
X-Gm-Message-State: AOAM533sAM6LvE4XDv1Govg15mvOJ6z55vANTOp6SumEh0nMhjYVdodQ
        g2vBQjY7Tv972NKHaaoiWQANySLvhSUKvk1CMy9/wA==
X-Google-Smtp-Source: ABdhPJwiWuWsZ9rDBEplPuvZMozvFuMlSiHqSq+TSiOVETX//qdGt0WliFg/mTvnT+2/jU6HM0drZDNa+3UoCHg8mkA=
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr28987102ejc.631.1648496197244; Mon, 28
 Mar 2022 12:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220223105600.1132593-1-maxime@cerno.tech> <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220225132258.55yh537iknxh72vw@houat> <CAGS_qxpzWE8DYVVj-pzvMgJqA25cwNh7wsP8nnUkMcZVyUF2Yg@mail.gmail.com>
 <20220228104718.yorlzq6264jtffak@houat> <CAGS_qxpu_OivRptp05gdSNhdSQzFUU_2bsdW1JSrs0c5bhGnrw@mail.gmail.com>
 <20220328075750.zfuvgd3q56cy5zir@houat>
In-Reply-To: <20220328075750.zfuvgd3q56cy5zir@houat>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Mon, 28 Mar 2022 14:36:25 -0500
Message-ID: <CAGS_qxoe9jX7ZN4XLJ3prT4SG_BeG8NGDX0FUes6er_3PChmpw@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Mar 28, 2022 at 2:57 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Fri, Mar 25, 2022 at 05:36:25PM -0500, Daniel Latypov wrote:
> > On Mon, Feb 28, 2022 at 4:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Fri, Feb 25, 2022 at 01:29:03PM -0800, Daniel Latypov wrote:
> > > > On Fri, Feb 25, 2022 at 5:23 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > Hi Daniel,
> > > > >
> > > > > On Wed, Feb 23, 2022 at 02:50:59PM -0800, Daniel Latypov wrote:
> > > > > > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > >
> > > > > > > Let's test various parts of the rate-related clock API with the kunit
> > > > > > > testing framework.
> > > > > > >
> > > > > > > Cc: kunit-dev@googlegroups.com
> > > > > > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > >
> > > > > > Tested-by: Daniel Latypov <dlatypov@google.com>
> > > > > >
> > > > > > Looks good to me on the KUnit side.
> > > > > > Two small nits below.
> > > > > >
> > > > > > FYI, I computed the incremental coverage for this series, i.e.:
> > > > > > 1) applied the full series
> > > > > > 2) computed the absolute coverage
> > > > > >
> > > > > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
> > > > > > --make_options=CC=/usr/bin/gcc-6 --kconfig_add=CONFIG_DEBUG_KERNEL=y
> > > > > > --kconfig_add=CONFIG_DEBUG_INFO=y --kconfig_add=CONFIG_GCOV=y
> > > > >
> > > > > I built a docker container based on ubuntu 18.04 to have gcc6 and
> > > > > python3.7, but this doesn't seem to be working, I'm not entirely sure why:
> > > > >
> > > > > [13:11:22] Configuring KUnit Kernel ...
> > > > > Regenerating .config ...
> > > > > Populating config with:
> > > > > $ make ARCH=um olddefconfig CC=/usr/bin/gcc-6 O=.kunit
> > > > > ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
> > > > > This is probably due to unsatisfied dependencies.
> > > > > Missing: CONFIG_DEBUG_INFO=y, CONFIG_GCOV=y
> > > > > Note: many Kconfig options aren't available on UML. You can try running on a different architecture with something like "--arch=x86_64".
> > > >
> > > > Did you perhaps drop CONFIG_DEBUG_KERNEL=y?
> > > > Need to add 3 config options in total for coverage.
> > > >
> > > > If I tweak the command I ran above but drop CONFIG_DEBUG_KERNEL=y, I
> > > > get the error message you get:
> > > >
> > > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
> > > > --make_options=CC=/usr/bin/gcc-6  --kconfig_add=CONFIG_DEBUG_INFO=y
> > > > --kconfig_add=CONFIG_GCOV=y
> > > > ...
> > > > Missing: CONFIG_DEBUG_INFO=y, CONFIG_GCOV=y
> > > > Note: many Kconfig options aren't available on UML. You can try
> > > > running on a different architecture with something like
> > > > "--arch=x86_64".
> > >
> > > It looks to me that it's more that DEBUG_INFO isn't enabled.
> >
> > Sorry for the very delayed response.
> > I was largely getting internet over mobile data around when this email
> > came in and didn't want to try and download docker images over that.
> >
> > It looks like that there was another change that is now merged into
> > Linus' tree that causes this.
> >
> > I found that adding this helped (thanks David Gow)
> >   --kconfig_add=DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> >
> > Running against --kunitconfig=lib/kunit, my final coverage result is
> >
> > Overall coverage rate:
> >   lines......: 13.6% (18004 of 132055 lines)
> >   functions..: 15.7% (1885 of 12010 functions)
> >
> > Can you give that a shot and see if it works?
>
> It does fix the configuration issue, but I'm not able to run the tests either:
>
> [07:53:51] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=um olddefconfig O=/home/max/out
> [07:53:53] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um olddefconfig O=/home/max/out
> Building with:
> $ make ARCH=um --jobs=16 O=/home/max/out
> [07:54:09] Starting KUnit Kernel (1/1)...
> [07:54:09] ============================================================
> [07:54:09] [ERROR] Test : invalid KTAP input!
> [07:54:09] ============================================================
> [07:54:09] Testing complete. Passed: 0, Failed: 0, Crashed: 0, Skipped: 0, Errors: 1
> [07:54:09] Elapsed time: 18.486s total, 2.430s configuring, 16.052s building, 0.003s running
>
>
> I've tried to remove all the coverage from the equation, and I get the
> same issue if I only run kunit run from inside the container, but it
> works fine outside. So I guess it's my setup that is broken. Is there
> some way to debug what could be going wrong there?

kunit.py is failing to find any test results from the raw kernel dmesg output.
That is stored in $BUILD_DIR/test.log, so /home/max/out/test.log.
(You can also have kunit.py print this out instead with `kunit.py run
--raw_output`)

It looks like it's specifically not finding the (K)TAP header.

Here's a snippet of what you'd expect to see:
<bunch of boot stuff>
printk: console [mc-1] enabled
TAP version 14
1..9
    # Subtest: clk-test
    1..4
    ok 1 - clk_test_get_rate
    ok 2 - clk_test_set_get_rate
<more kunit output in similar format>

Here's the failing lines in kunit_parser.py
   805  def parse_run_tests(kernel_output: Iterable[str]) -> Test:
   817          lines = extract_tap_lines(kernel_output)   <= lines
after "K?TAP version"
   818          test = Test()
   819          if not lines:
   820                  test.add_error('invalid KTAP input!')  <= this error msg
   821                  test.status = TestStatus.FAILURE_TO_PARSE_TESTS

Normally the issue people run into is that KUnit prints a header but
has no tests.
That's a different error than what you see here.

It seems like we're either not running this func
   206  static void kunit_exec_run_tests(struct suite_set *suite_set)
   207  {
   208          struct kunit_suite * const * const *suites;
   209
   210          kunit_print_tap_header(suite_set); <= not hitting this line?
   211
   212          for (suites = suite_set->start; suites <
suite_set->end; suites++)
   213                  __kunit_test_suites_init(*suites);
   214  }

or maybe the output got mangled somehow?

Daniel
